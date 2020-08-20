class AddRecruitsAndEventsAndFaqToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :recruit, :string
    add_column :companies, :event, :string
    add_column :companies, :faq, :string
  end
end
