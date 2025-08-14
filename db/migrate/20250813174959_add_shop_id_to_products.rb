class AddShopIdToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :shop_id, :integer
  end
end
