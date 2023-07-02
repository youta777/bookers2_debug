class CreateRelationships < ActiveRecord::Migration[6.1]
  def up
    create_table :relationships do |t|
      t.timestamps

      t.integer :follower_id, null: false
      t.integer :follow_id,   null: false
    end

    add_index :relationships, :follower_id
    add_index :relationships, :follow_id
    add_index :relationships,[:follower_id, :follow_id], unique: true
  end

  def down
    drop_table :relationships
  end
end
