# == Schema Information
#
# Table name: organisation_members
#
#  id           :bigint           not null, primary key
#  organisation :string           not null
#  github_name  :string           not null
#
class OrganisationMember < ApplicationRecord
  validates :github_name, uniqueness: { scope: :organisation }

  def self.create_all_from_organisation(organisation)
    OrganisationMember.where(organisation:).destroy_all
    # rubocop:disable Rails/FindEach
    # This is not a rails structure
    Rails.application.config.github.orgs.members.all(organisation).each do |member|
      OrganisationMember.create(organisation:, github_name: member['login'])
    end
    # rubocop:enable Rails/FindEach
  end
end
