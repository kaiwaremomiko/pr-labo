class AddCategoryToManufactures < ActiveRecord::Migration[5.2]
  def change
    add_column :manufactures, :big_category, :string
    add_column :manufactures, :small_category, :string
  end
end
