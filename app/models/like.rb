class Like < ActiveRecord::Base
  belongs_to :review, counter_cache: true
  belongs_to :user
end
