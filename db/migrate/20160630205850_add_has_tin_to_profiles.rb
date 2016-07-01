class AddHasTinToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :has_tin, :boolean, :default => false
  end
end
