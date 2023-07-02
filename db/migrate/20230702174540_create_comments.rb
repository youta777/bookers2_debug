class CreateComments < ActiveRecord::Migration[6.1]
  def up
    create_table :comments do |t|
      t.timestamps

      t.text    :comment
      t.integer :user_id
      t.integer :book_id
    end
  end

  def down
    drop_table :comments
  end
end
