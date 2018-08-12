class AddPublishToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :publish, :boolean
  end
end
