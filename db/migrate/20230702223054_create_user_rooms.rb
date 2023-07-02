class CreateUserRooms < ActiveRecord::Migration[6.1]
  def up
    create_table :user_rooms do |t|
      t.timestamps

      t.integer :user_id
      t.integer :room_id
    end
  end
  
  def down
    drop_table :user_rooms
  end
end
