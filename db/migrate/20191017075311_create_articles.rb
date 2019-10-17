class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :heading
      t.text :introduction

      t.timestamps
    end
  end
end
