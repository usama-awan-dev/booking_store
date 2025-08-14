class AddUserIdToShops < ActiveRecord::Migration[7.2]
  def change
     add_column :shops, :user_id, :integer
  end
end
