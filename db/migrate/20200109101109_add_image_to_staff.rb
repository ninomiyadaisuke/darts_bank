class AddImageToStaff < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :image, :string
  end
end
