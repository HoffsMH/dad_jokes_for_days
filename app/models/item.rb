class Item < ActiveRecord::Base
  belongs_to :category

  validates :name, :description, :image_url, :dao, :price,  presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true

  before_validation :establish_daoism, :establish_image_url
  def establish_daoism
    if name
      self.dao = name.downcase.gsub(" ", "")
    end
  end

  def to_param
    dao
  end

  def establish_image_url
    if image_url.blank?
      self.image_url = "http://i.imgur.com/yJfmkeK.png"
    end
  end
end
