class LikesController < ApplicationController
  def create
    review = Review.find(params["review_id"])
    @shop = Shop.find(review.shop_id)

    @like = Like.new(like_params)
    if @like.save
      flash[:notice] = "Thanks for the like!"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = " That didnt work!"
      render :new
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @shop = @like.review.shop
    if @like.destroy
      flash[:notice] = "You just unliked that review!"
      redirect_to shop_path(@shop)
    end
  end

  private

  def like_params
    { review_id: params[:review_id], user: current_user}
    # params.require(:like).permit(:review_id).merge(user: current_user)
  end
end


# SELECT  "likes".* FROM "likes"  WHERE "likes"."review_id" = 2 AND "likes"."user_id" = 1  ORDER BY "likes"."id" ASC LIMIT 1
# SELECT  "likes".* FROM "likes"  WHERE "likes"."id" = $1 LIMIT 1  [["id", 1]]
