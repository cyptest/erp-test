class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :ref
      t.string :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :price
      t.integer :price_cents
      t.integer :stock
      t.boolean :active
      t.integer :stock

      t.timestamps
    end
  end
end
