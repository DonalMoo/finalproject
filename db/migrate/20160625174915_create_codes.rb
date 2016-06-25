class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code
      t.datetime :redeemed_at
      t.integer :campaign_id

      t.timestamps null: false
    end
    add_index :codes, :campaign_id
  end
end
