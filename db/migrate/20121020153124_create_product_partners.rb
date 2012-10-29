class CreateProductPartners < ActiveRecord::Migration
  def self.up
    # Create the association table
    create_table :product_partners, :id => false do |t|
      t.integer :partner_id
      t.integer :product_id
    end

    # Add table index
    add_index :product_partners, :partner_id
    add_index :product_partners, :product_id
    add_index :product_partners, [:partner_id, :product_id], :unique => true

  end

  def self.down
    drop_table :product_partners
  end  
end
