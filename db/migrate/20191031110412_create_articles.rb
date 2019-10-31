class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :kind
      t.text :heading
      t.string :gender
      t.string :minimum_age
      t.string :maximum_age
      t.integer :age
      t.string :area
      t.text :introduction
      t.string :image
      
      t.timestamps
    end
  end
end
