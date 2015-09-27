class Order < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :status, presence: true
end
