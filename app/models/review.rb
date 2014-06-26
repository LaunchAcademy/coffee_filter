class Review < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user
  validates :rating, presence: true
  validates :body, presence: true
  validates :user, presence: true
  validates :shop, presence: true
end
