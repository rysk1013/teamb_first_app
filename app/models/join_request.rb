class JoinRequest < ApplicationRecord

  belongs_to :user
  belongs_to :project

  with_options presence: true do
    validates :user_id, uniqueness: { scope: :project_id}
    validates :project_id, uniqueness: { scope: :user_id}
  end

end
