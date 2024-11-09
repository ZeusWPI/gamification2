# == Schema Information
#
# Table name: repositories
#
#  id           :bigint           not null, primary key
#  clone_url    :string           not null
#  github_url   :string           not null
#  name         :string           not null
#  organisation :string           not null
#  path         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_repositories_on_organisation_and_name  (organisation,name) UNIQUE
#
class Repository < ApplicationRecord
  has_many :commits, dependent: :restrict_with_error
  has_many :coders, -> { distinct }, through: :commits

  validates :name, uniqueness: { scope: :organisation }
  validate :not_filtered

  before_create :set_path
  after_save :reprocess_delayed

  def self.create_or_update_from_github_api(organisation, name, github_url, clone_url)
    Repository.find_or_initialize_by(organisation:, name:) do |r|
      r.github_url = github_url
      r.clone_url = clone_url
    end.save
  end

  private

  def set_path
    self.path = Rails.root.join("repos/#{organisation.parameterize}_#{name.parameterize}")
  end

  def not_filtered
    errors.add(:name, 'filtered') if Rails.application.config.repo_name_deny_list.include?(name)
  end

  def reprocess_delayed
    delay.reprocess
  end

  def reprocess
    OrganisationMember.create_all_from_organisation(organisation)
    pull_or_clone
    process_commits
  end

  def process_commits
    rugged_repo.tap do |r|
      walker = Rugged::Walker.new(r)
      r.branches.each { |b| walker.push b.target_id }
      walker.each { |c| Commit.from_rugged(c, self) }
    end
  end

  def pull_or_clone
    if Dir.exist?(path)
      logger.info("Fetching #{name} and resetting to FETCH_HEAD")
      rugged_repo.tap do |r|
        r.remotes.each(&:fetch)
        r.reset('FETCH_HEAD', :hard)
      end
    else
      Rugged::Repository.clone_at(clone_url, path)
    end
  end

  def rugged_repo
    Rugged::Repository.new(path)
  end
end
