class AddSomecolumnsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :establishment, :string
    add_column :companies, :capital, :string
  end
end
