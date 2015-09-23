class Category < ActiveRecord::Base
  has_many :items
  validates :name, :dao, presence: true
  validates :name, uniqueness: true

  before_validation do
    if name
      self.dao = name.downcase.gsub(" ", "")
    end
  end

  def to_param
    dao
  end
end
