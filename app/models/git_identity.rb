# == Schema Information
#
# Table name: git_identities
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  email      :string           not null
#  coder_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GitIdentity < ApplicationRecord
  belongs_to :coder

  def self.from_commit(rc, repo)
    identity = find_by(name: rc.author[:name], email: rc.author[:email])
    return identity if identity.present?

    coder = Coder.from_github(rc, repo)
    return nil if coder.blank?

    create(name: rc.author[:name], email: rc.author[:email], coder:)
  end
end
