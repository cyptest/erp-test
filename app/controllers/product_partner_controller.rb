class ProductPartnerController < ApplicationController
  before_filter :authenticate
  
  def create
    @product = Product.find(params[:productpartner][:partner_id])
    current_partner.addproduct!(@partner)
    respond_to do |format|
      format.html { redirect_to @partner }
      format.js
    end
  end
  
  def destroy
    @product = ProductPartner.find(params[:id]).followed
    current_partner.deleteproduct!(@partner)
    respond_to do |format|
      format.html { redirect_to @partner }
      format.js
    end
  end
end
