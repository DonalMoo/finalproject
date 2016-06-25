class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.integer :max_code

      t.timestamps null: false
    end
  end
end
