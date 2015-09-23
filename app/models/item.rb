class Item < ActiveRecord::Base
  belongs_to :category

  validates :name, :description, :image_url, :dao, presence: true
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
