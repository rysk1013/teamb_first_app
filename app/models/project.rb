class Project < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :member_lim, numericality: { only_integer: true }
    validates :project_lim
    validates :content
  end

  belongs_to :user

end
