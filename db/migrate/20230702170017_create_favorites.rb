class CreateFavorites < ActiveRecord::Migration[6.1]
  def up
    create_table :favorites do |t|
      t.timestamps

      t.integer :user_id
      t.integer :book_id
    end
  end

  def down
    drop_table :favorites
  end
end