# == Schema Information
# Schema version: 20121017210129
#
# Table name: products
#
#  id                 :integer         not null, primary key
#  company            :string(255)
#  name               :string(255)
#  address            :string(255)
#  city               :string(255)
#  postal_code        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  email			        :string(255)
#  active             :boolean

class Partner < ActiveRecord::Base
  attr_accessible :active, :address, :city, :company, :created_at, :email, :name, :postal_code, :updated_at
  validates_presence_of :address, :city, :company, :name, :email, :postal_code
  
  # has_many :productpartner
  has_many :product, :through => :productpartner, :dependent => :destroy, :source => :partner_id
  # has_and_belongs_to_many :product

  def self.search(search)
  	if search
    	find(:all, :conditions => ['company LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
  end

  def addproduct!(partnered)
    partner.productpartner.create!(:partner_id => partner.id)
  end
  
  def deleteproduct!(partnered)
    partner.productpartner.find_by_partnered_id(partnered).destroy
  end  

end
