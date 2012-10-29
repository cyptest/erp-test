class ProductPartner < ActiveRecord::Base
  attr_accessible :created_at, :updated_at, :partner_id

  belongs_to :partner
  belongs_to :product

  validates :partner_id, :presence => true
  validates :product_id, :presence => true

  def index
      @productpartner = ProductPartner.paginate(:page => params[:page])
  end 

end
