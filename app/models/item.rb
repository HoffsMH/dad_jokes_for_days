class Item < ActiveRecord::Base
  belongs_to :category

  validates :name, :dao, presence: true

  before_validation do
    if name
      self.dao = name.downcase.gsub(" ", "")
    end
  end

  def to_param
    dao
  end
end
