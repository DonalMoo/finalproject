class AddPreviewToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :preview_url, :string
  end
end
