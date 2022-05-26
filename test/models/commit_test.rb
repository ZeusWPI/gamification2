# == Schema Information
#
# Table name: commits
#
#  id            :bigint           not null, primary key
#  coder_id      :bigint           not null
#  repository_id :bigint           not null
#  sha           :string           not null
#  additions     :integer          not null
#  deletions     :integer          not null
#  committed_at  :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class CommitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
