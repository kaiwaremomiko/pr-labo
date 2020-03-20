class Occupation < ActiveRecord::Migration[5.2]
  def change
    drop_table :occupations
  end
end
