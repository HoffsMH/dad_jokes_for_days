class Category < ActiveRecord::Base
  has_many :items
  validates :name, :dao, presence: true

  before_validation do
    if name
      self.dao = name.downcase.gsub(" ", "")
    end
  end


  def to_param
    self.dao
  end
end
