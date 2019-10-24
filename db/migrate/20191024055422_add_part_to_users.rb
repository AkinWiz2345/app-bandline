class AddPartToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :part, :string
  end
end
