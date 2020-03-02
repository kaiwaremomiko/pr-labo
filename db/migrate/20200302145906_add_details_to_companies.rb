class AddDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :area, :string
  end
end
