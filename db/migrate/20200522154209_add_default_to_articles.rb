class AddDefaultToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :slug, null:false, default: 0
  end
end
