class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  
  validates :user_id, :status, presence: true
end
