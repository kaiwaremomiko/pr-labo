class CreateOccupations < ActiveRecord::Migration[5.2]
  def change
    create_table :occupations do |t|
      t.string :occupation_name
      t.string :category
      t.string :work_contents
      t.string :how_to_work
      t.string :under_high_school_graduate
      t.string :high_school_graduate
      t.string :college_graduate
      t.string :number_employee
      t.string :working_time
      t.string :payment
      t.string :age

      t.timestamps
    end
  end
end
