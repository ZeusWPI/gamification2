# == Schema Information
#
# Table name: commits
#
#  id            :bigint           not null, primary key
#  additions     :integer          not null
#  committed_at  :datetime         not null
#  deletions     :integer          not null
#  score         :integer
#  sha           :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  coder_id      :bigint           not null
#  repository_id :bigint           not null
#
# Indexes
#
#  index_commits_on_coder_id       (coder_id)
#  index_commits_on_repository_id  (repository_id)
#
# Foreign Keys
#
#  fk_rails_...  (coder_id => coders.id)
#  fk_rails_...  (repository_id => repositories.id)
#
require 'test_helper'

class CommitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
