class CreateTemps < ActiveRecord::Migration[5.2]
  def change
    create_table :temps do |t|
      t.integer :max
      t.integer :min

      t.timestamps
    end
  end
end
