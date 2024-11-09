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
class GitIdentity < ApplicationRecord
  belongs_to :coder, validate: true

  validates :name, presence: true
  validates :email, presence: true

  def self.from_commit(rc, repo)
    identity = find_by(name: rc.author[:name], email: rc.author[:email])
    return identity if identity.present?

    coder = Coder.from_github(rc, repo)
    return nil if coder.blank?

    create(name: rc.author[:name], email: rc.author[:email], coder:)
  end
end
