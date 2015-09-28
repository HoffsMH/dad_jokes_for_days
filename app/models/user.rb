class User < ActiveRecord::Base
  has_secure_password
  validates :email, :user_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :password
  
  has_many :orders
end
