class AddHasBodToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :has_bod, :boolean, default: 0
  end
end
