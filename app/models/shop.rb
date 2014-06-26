class Shop < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name,
    message: "This shop already exists" }
  validates :description, presence: true
  validates :user, presence: true
end
