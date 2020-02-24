class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
