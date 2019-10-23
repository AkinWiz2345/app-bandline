class AddDetailsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :gender, :integer
    add_column :articles, :minimum_age, :integer
    add_column :articles, :maximum_age, :integer
    add_column :articles, :age, :integer
    add_column :articles, :area, :integer
    add_column :articles, :part, :integer
    add_column :articles, :image, :string
  end
end
