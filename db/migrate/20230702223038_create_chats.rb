class CreateChats < ActiveRecord::Migration[6.1]
  def up
    create_table :chats do |t|
      t.timestamps

      t.text    :message
      t.integer :user_id
      t.integer :room_id
    end
  end

  def down
    drop_table :chats
  end
end
