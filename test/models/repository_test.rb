# == Schema Information
#
# Table name: repositories
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  path         :string           not null
#  github_url   :string           not null
#  clone_url    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  organisation :string           not null
#
require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
