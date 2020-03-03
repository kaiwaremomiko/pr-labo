class AddPrToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :pr, :text
  end
end
