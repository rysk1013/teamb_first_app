class Project < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :member_lim, numericality: { only_integer: true }
    validates :project_lim
    validates :content
  end

  has_many :join_requests, dependent: :destroy
  has_many :join_lists, dependent: :destroy

  has_many :users, through: :join_requests
  has_many :users, through: :join_lists


  def already_listed?(user)
    self.join_lists.exists?(user_id: user.id)
  end

  def already_requested?(user)
    self.join_requests.exists?(user_id: user.id)
  end

end
