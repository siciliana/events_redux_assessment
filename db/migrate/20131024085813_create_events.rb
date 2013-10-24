class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.string :location
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end

    add_index :events, :user_id
  end
end
