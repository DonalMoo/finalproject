class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :description
      t.integer :price
      t.string :image_url

      t.timestamps null: false
    end
  end
end
