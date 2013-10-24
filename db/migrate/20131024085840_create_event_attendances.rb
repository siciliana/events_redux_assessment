class CreateEventAttendances < ActiveRecord::Migration
  def change
    create_table :event_attendances do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end

    add_index :event_attendances, [:user_id, :event_id], :unique => true
    add_index :event_attendances, :event_id
  end
end
