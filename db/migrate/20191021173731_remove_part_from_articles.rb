class RemovePartFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :part, :integer
  end
end
