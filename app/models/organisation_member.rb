# == Schema Information
#
# Table name: organisation_members
#
#  id           :bigint           not null, primary key
#  github_name  :string           not null
#  organisation :string           not null
#
# Indexes
#
#  index_organisation_members_on_organisation_and_github_name  (organisation,github_name) UNIQUE
#
class OrganisationMember < ApplicationRecord
  validates :github_name, uniqueness: { scope: :organisation }

  def self.create_all_from_organisation(organisation)
    members = Rails.application.config.github.orgs.members.all(organisation)

    OrganisationMember.transaction do
      OrganisationMember.where(organisation:).destroy_all
      members.each do |member|
        OrganisationMember.create(organisation:, github_name: member['login'])
      end
    end
  end
end
