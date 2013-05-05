class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :username 
    	t.string :remember_token
    	t.boolean :admin, default: false

      t.timestamps
    end
  end
end
