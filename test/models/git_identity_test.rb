# == Schema Information
#
# Table name: git_identities
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coder_id   :bigint           not null
#
# Indexes
#
#  index_git_identities_on_coder_id        (coder_id)
#  index_git_identities_on_name_and_email  (name,email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (coder_id => coders.id)
#
require 'test_helper'

class GitIdentityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
