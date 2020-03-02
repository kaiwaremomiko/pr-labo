class AddContentToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :pr, :string
  end
end
