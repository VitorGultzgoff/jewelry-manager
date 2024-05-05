class CreateConsignments < ActiveRecord::Migration[7.0]
  def change
    create_table :consignments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
