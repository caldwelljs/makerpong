class AddLastNameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :last_name, :string
  end
end
