class AddNameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :name, :string
  end
end
