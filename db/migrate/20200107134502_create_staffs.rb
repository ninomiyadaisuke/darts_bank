class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.integer :user_id
      t.string :shop_name
      t.string :staff_name
      t.string :nickname
      t.string :rating
      t.string :introduction

      t.timestamps
    end
  end
end
