class AddImgToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :img, :string
  end
end
