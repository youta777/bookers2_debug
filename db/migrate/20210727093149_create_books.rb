class CreateBooks < ActiveRecord::Migration[6.1]
  def up
    create_table :books do |t|
      t.timestamps

      t.string  :title
      t.text    :body
      t.integer :user_id
    end
  end

  def down
    drop_table :books
  end
end
