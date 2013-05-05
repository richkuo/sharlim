class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, :null => false
      t.string :tagline
      t.string :description
      t.datetime :when
      t.decimal :price
      t.integer :host_id
      t.boolean :paid, :default => false
      t.timestamps
    end

    add_index :events, :host_id
  end
end
