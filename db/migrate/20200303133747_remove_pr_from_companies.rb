class RemovePrFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :pr, :string
  end
end
