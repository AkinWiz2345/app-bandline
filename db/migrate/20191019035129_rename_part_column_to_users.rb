class RenamePartColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :part, :parts
  end
end
