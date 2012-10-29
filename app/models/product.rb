# == Schema Information
# Schema version: 20121017214014
#
# Table name: products
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  ref                :string(255)
#  description        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  stock              :integer
#  price		  	  :integer
#  price_cents		  :integer
#  active             :boolean
#  partner			  :references

class Product < ActiveRecord::Base
  attr_accessible :active, :created_at, :description, :name, :ref, :price, :price_cents, :stock, :updated_at
  validates_presence_of :description, :name, :ref, :price, :price_cents, :stock

  belongs_to :partner
  # has_many :partner, :through => :productpartner, :dependent => :destroy
  # has_and_belongs_to_many :partner
  monetize :price_cents

  # Use EUR as model level currency
  register_currency :eur

  # monetize :discount_subunit, :as => "discount"
  # monetize :bonus_cents  

  def self.search(search)
  	if search
    	find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
  end

end
