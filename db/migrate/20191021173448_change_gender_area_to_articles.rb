class ChangeGenderAreaToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :gender, :string
    change_column :articles, :area, :string
  end
end
