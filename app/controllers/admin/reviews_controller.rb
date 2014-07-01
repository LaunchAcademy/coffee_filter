class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Just deleted a review!"
    else
      flash[:notice] = "Oops..."
    end
    redirect_to admin_reviews_path
  end
end
