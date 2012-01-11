class RenameServicesTypeToCategory < ActiveRecord::Migration
  def up
    rename_column :services, :type, :category
  end

  def down
    rename_column :services, :category, :type
  end
end
