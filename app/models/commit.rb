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
#  score         :integer
#
class Commit < ApplicationRecord
  belongs_to :coder, validate: true
  belongs_to :repository, validate: true

  def self.from_rugged(rc, repository)
    committer = GitIdentity.from_commit(rc, repository)&.coder

    return nil if committer.blank?

    Commit.find_or_initialize_by(repository:, sha: rc.oid, coder: committer) do |c|
      c.committed_at = rc.time
      if rc.parents.count >= 2 # No reward for merges
        c.deletions = 0
        c.additions = 0
      else
        diff = if rc.parents.empty? # Root commit
                 rc.diff
               else
                 rc.parents.first.diff(rc)
               end
        c.additions = diff.stat[1]
        c.deletions = diff.stat[2]
      end
    end.save
  end
end
