class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :complement
      t.string :zipcode
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
