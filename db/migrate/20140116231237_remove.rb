class Remove < ActiveRecord::Migration
  def change
    remove_column :players, :first_name, :string
  end
end
