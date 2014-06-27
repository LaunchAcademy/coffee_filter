class LikesController < ApplicationController
  def create
    review = Review.find(params["review_id"])
    @shop = Shop.find(review.shop_id)
    redirect_to shop_path(@shop)
  end

  def destroy
  end
end
