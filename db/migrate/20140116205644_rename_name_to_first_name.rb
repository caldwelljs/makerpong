class RenameNameToFirstName < ActiveRecord::Migration
  def change
    rename_column :player, :name, :first_name
  end
end
