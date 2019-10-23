class ChangeDataGenderAreaToAriticles < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :gender, :string
    change_column :users, :area, :string
  end
end
