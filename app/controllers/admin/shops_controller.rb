class Admin::ShopsController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_to_edit

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.find(params[:id])

    if @shop.save(shop_params)
      flash[:notice] = "Successfully added #{@shop.name}!"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = 'Invalid input.'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop.update_attributes(shop_params)
      flash[:notice] = "Successfully updated #{@shop.name}!"
      redirect_to admin_shop_path(@shop)
    else
      flash[:notice] = 'Invalid input.'
    end
  end

  def destroy
    @shop = Shop.find(params[:id]).destroy
    flash[:notice] = "#{@shop.name} deleted."
    redirect_to admin_shops_path
  end

  private

  def authorize_to_edit
    if current_user.is_admin?
      true
    else
     flash[:notice] = "You dont have permission to edit that review!"
    end
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :description).merge(user: current_user)
  end

end
