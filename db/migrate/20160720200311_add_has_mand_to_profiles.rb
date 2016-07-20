class AddHasMandToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :has_mand, :boolean, :default => false
    add_column :profiles, :has_fiddle, :boolean, :default => false
  end
end
