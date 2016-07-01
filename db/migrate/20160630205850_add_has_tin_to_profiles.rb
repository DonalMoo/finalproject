class AddHasTinToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :has_tin, :boolean, default: 0
  end
end
