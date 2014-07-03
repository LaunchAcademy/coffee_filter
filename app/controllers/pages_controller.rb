class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @top_three = Shop.highest_rated
  end
end
