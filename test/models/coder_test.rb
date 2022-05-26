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
require 'test_helper'

class CoderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
