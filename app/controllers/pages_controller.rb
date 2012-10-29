class PagesController < ApplicationController

  def home
    @title = "Home"
    @partners = Partner.find(:all, :limit => "5", :order => "updated_at DESC")
    @products = Product.find(:all, :limit => "5", :order => "updated_at DESC")
    @users = User.find(:all, :limit => "5")
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end