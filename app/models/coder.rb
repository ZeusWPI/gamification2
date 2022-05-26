# == Schema Information
#
# Table name: coders
#
#  id          :bigint           not null, primary key
#  full_name   :string           not null
#  github_name :string           not null
#  avatar_url  :string           not null
#  github_url  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Coder < ApplicationRecord
  has_many :commits, dependent: :restrict_with_error
  has_many :repositories, -> { distinct }, through: :commits
  has_many :git_identities, dependent: :restrict_with_error

  scope :with_metrics, lambda {
    repository_count = Repository.joins(:commits).group('commits.coder_id').select('COUNT(DISTINCT(repositories.id)) as repository_count, coder_id')
    commit_columns = Commit.group(:coder_id).select('COUNT(commits.id) as commit_count, SUM(ROUND(LN(additions + 1) * 10)) as score, SUM(additions) as additions, SUM(deletions) as deletions, coder_id')
    joins("INNER JOIN (#{repository_count.to_sql}) repository_counts ON coders.id = repository_counts.coder_id")
      .joins("INNER JOIN (#{commit_columns.to_sql}) commit_columns ON coders.id = commit_columns.coder_id")
      .select("#{Coder.table_name}.*", 'repository_count', 'score', 'commit_count', 'additions', 'deletions')
  }

  def self.from_github(rc, repo)
    commit = Rails.application.config.github.repos.commits.get(Rails.application.config.organisation, repo.name, rc.oid)
    return nil if commit.author&.login.blank?

    Coder.find_or_create_by(github_name: commit.author.login) do |c|
      Rails.application.config.github.users.get(user: commit.author.login).tap do |data|
        c.full_name = data.try(:name) || ''
        c.avatar_url = data.avatar_url
        c.github_url = data.html_url
      end
    end
  end
end
