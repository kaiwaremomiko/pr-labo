class AddManycolumnsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :representative, :string
    add_column :companies, :tel_number, :string
    add_column :companies, :work_field, :string
  end
end
