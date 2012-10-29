class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :company
      t.string :name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :active

      t.timestamps
    end
  end
end
