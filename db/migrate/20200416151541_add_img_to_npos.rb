class AddImgToNpos < ActiveRecord::Migration[5.2]
  def change
    add_column :npos, :img, :string
  end
end
