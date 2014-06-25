class Shop < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name,
    message: "This shop already exists" }
  validates :description, presence: true
end
