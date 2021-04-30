class Project < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :member_lim, numericality: { only_integer: true }
    validates :project_lim
    validates :content
  end

  has_many :users, through: :join_lists
  has_many :join_lists, dependent: :destroy
  has_many :join_requests, dependent: :destroy

  def user_join_list?(user)
    users.include?(user)
  end

end
