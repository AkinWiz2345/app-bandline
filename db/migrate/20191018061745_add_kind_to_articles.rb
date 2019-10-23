class AddKindToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :kind, :string
  end
end
