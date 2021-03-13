class CreatePostRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :post_relationships do |t|
      t.references :post, foreign_key: true
      t.references :cloth, foreign_key: true

      t.timestamps
    end
  end
end
