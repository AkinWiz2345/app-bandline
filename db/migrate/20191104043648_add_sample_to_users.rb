class AddSampleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sample, :boolean, default: false, null: false
  end
end
