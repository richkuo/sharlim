class CreateGuestlists < ActiveRecord::Migration
  def change
    create_table :guestlists do |t|
      t.integer :event_id
      t.integer :viewer_id

      t.timestamps
    end

    add_index :guestlists, :event_id
    add_index :guestlists, :viewer_id
    add_index :guestlists, [:event_id, :viewer_id], unique: true
  end
end
