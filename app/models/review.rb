class Review < ActiveRecord::Base
  belongs_to :shop
  validates :rating, presence: true
  validates :body, presence: true
end
