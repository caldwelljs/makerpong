class RenameNameToFirstName < ActiveRecord::Migration
  def change
    rename_column :players, :name, :first_name
  end
end
