class Shop < ActiveRecord::Base
  has_many :reviews
  has_many :pictures
  has_many :favorites

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true
end
