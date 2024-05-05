class RemoveIsThirdPartyFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :is_third_party, :boolean
  end
end
