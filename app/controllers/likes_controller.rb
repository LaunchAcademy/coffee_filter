class LikesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    @shop = Shop.find(review.shop_id)

    @like = Like.new(like_params)
    if @like.save
      flash[:notice] = "Thanks for the like!"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = " That didnt work!"
      redirect_to shop_path(@shop)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @shop = @like.review.shop
    if @like.destroy
      flash[:notice] = "You just unliked that review!"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = "Im sorry, that did not work!"
      redirect_to shop_path(@shop)
    end
  end

  private

  def like_params
    { review_id: params[:review_id], user: current_user}
  end
end
