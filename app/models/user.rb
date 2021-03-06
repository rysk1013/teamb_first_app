class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname, length: { maximum: 20 }
  end

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "を半角英数字にしてください", on: :create } do
    validates :password
    validates :password_confirmation
  end

  has_many :join_requests, dependent: :destroy
  has_many :join_lists, dependent: :destroy
  
  has_many :projects, through: :join_requests
  has_many :projects, through: :join_lists
  

end
