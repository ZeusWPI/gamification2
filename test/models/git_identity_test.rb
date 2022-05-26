# == Schema Information
#
# Table name: git_identities
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  coder_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class GitIdentityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
