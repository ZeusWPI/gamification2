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
require 'test_helper'

class OrganisationMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
