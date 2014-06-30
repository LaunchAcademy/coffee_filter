class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shops
  has_many :likes
  has_many :reviews


  validates :first_name, presence: true
  validates :last_name, presence: true

  def has_voted_on?(review)
    vote = Like.where(review: review, user: self).first
  end

  # def vote_for(review)
  #   vote = Like.where(review: review, user: self).first
  # end
end
