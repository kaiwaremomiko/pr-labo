class CreateManufactures < ActiveRecord::Migration[5.2]
  def change
    create_table :manufactures do |t|
      t.string :corporate_name
      t.string :category
      t.string :industry
      t.string :address
      t.string :tel_number
      t.string :establishment
      t.string :capital
      t.string :employees
      t.string :postal_code
      t.string :official_site
      t.string :img
      t.text :pr

      t.timestamps
    end
  end
end
