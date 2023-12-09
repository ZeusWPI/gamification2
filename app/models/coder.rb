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

  validates :github_name, uniqueness: true

  scope :in_organisation, -> { where(github_name: OrganisationMember.select(:github_name)) }

  def self.from_github(rc, repo)
    commit = Rails.application.config.github.repos.commits.get(repo.organisation, repo.name, rc.oid)
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
