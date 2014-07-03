class Shop < ActiveRecord::Base
  paginates_per 5
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true, uniqueness: {
    scope: :name, message: "This shop already exists"
  }
  validates :description, presence: true
  validates :user, presence: true

  def self.search(search)
    if search
      where("name iLIKE '%#{search}%'")
    else
      all
    end
  end

  def self.highest_rated(count=3)
    joins(:reviews).group('shops.id').order('avg(reviews.rating) desc').limit(count)
  end
end
