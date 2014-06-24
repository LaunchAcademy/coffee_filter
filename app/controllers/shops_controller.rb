class ShopsController < ApplicationController
  def index
    @shops = Shop.order(created_at: :desc)
  end
end
