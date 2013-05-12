class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
    	t.integer :user_id
    	t.integer :event_id
    	t.integer :amount
    	t.boolean :paid, :default => false
    	t.boolean :refunded, :default => false
    	t.string :stripe_id

      t.timestamps
    end
  end
end
