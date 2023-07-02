class CreateViewCounts < ActiveRecord::Migration[6.1]
  def up
    create_table :view_counts do |t|
      t.timestamps

      t.integer :book_id
      t.integer :user_id
    end
  end

  def down
    drop_table :view_counts
  end
end
