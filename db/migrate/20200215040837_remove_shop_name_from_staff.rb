class RemoveShopNameFromStaff < ActiveRecord::Migration[5.2]
  def change
    remove_column :staffs, :shop_name, :string
  end
end
