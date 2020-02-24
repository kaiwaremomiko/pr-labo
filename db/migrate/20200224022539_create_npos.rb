class CreateNpos < ActiveRecord::Migration[5.2]
  def change
    create_table :npos do |t|
      t.string :corporate_name
      t.string :prefecture
      t.string :address
      t.string :representative
      t.string :certification_date
      t.string :establish_purpose
      t.string :field

      t.timestamps
    end
  end
end
