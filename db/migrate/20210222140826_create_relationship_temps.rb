class CreateRelationshipTemps < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_temps do |t|
      t.references :category, foreign_key: true
      t.references :temp, foreign_key: true

      t.timestamps
    end
  end
end
