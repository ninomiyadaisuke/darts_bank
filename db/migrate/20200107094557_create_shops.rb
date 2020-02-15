class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :shop_name
      t.integer :postal
      t.string :prefecture_name
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
