class ShopsController < ApplicationController
  def index
    @shops = Shop.order(created_at: :desc)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(user_params)

    if @shop.save
      flash[:notice] = "Shop added!"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = "Please correct the errors and try again"
      render :new
    end
  end


  private

  def user_params
    params.require(:shop).permit(:name, :address, :description)
  end
end
