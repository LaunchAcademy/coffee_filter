class Shop < ActiveRecord::Base
  paginates_per 10
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name,
    message: "This shop already exists" }
  validates :description, presence: true
  validates :user, presence: true

  def self.search(search)
    if search
      Shop.where("name iLIKE '%#{search}%'")
    else
      Shop.all
    end
  end
end
