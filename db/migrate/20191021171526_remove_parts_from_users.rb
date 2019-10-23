class RemovePartsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :parts, :integer
  end
end
