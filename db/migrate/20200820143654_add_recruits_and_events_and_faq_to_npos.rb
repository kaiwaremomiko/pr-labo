class AddRecruitsAndEventsAndFaqToNpos < ActiveRecord::Migration[5.2]
  def change
    add_column :npos, :recruit, :string
    add_column :npos, :event, :string
    add_column :npos, :faq, :string
  end
end
