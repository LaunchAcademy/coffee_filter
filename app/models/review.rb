class Review < ActiveRecord::Base
  has_many :likes
  belongs_to :shop
  belongs_to :user
  validates :rating, presence: true
  validates :body, presence: true
end
