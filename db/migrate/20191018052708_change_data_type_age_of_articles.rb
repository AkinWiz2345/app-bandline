class ChangeDataTypeAgeOfArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :minimum_age, :string
    change_column :articles, :maximum_age, :string
  end
end
