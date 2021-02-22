class AddNameToTemp < ActiveRecord::Migration[5.2]
  def change
    add_column :temps, :name, :string
  end
end
