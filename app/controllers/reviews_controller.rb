class ReviewsController < ApplicationController
  def index
  end

  def create
    @shop = Shop.find(params["shop_id"])
    @review = Review.new(review_params)

    @review.shop = @shop
    if @review.save
      flash[:notice] = "Review has been added"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = "review did not go through!"
      redirect_to shop_path(@shop)
    end
  end

  def edit
    @review = Review.find(params[:id])
    @shop = @review.shop
  end

  def update
    @review = Review.find(params[:id])
    @shop = @review.shop

    if @review.update(review_params)
      flash[:notice] = "Review updated!"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = "Review did not go through!"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body).merge(user: current_user)
  end
end
