class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :corporate_name
      t.string :postal_code
      t.string :address
      t.string :area
      t.text :pr
      t.string :img
      t.string :representative
      t.string :tel_number
      t.string :work_field
      t.string :establishment
      t.string :capital

      t.timestamps
    end
  end
end
