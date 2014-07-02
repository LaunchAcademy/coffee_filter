class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @top_three = Shop.highest_rated
    @top_three.first.name
  end
end
