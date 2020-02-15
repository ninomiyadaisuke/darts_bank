class ChangeDatatypePostalOfShops < ActiveRecord::Migration[5.2]
  def change
     change_column :shops, :postal, :string
  end
end
