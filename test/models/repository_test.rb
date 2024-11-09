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
require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
