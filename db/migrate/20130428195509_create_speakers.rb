class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :first_name
      t.string :last_name
      t.string :biography
      t.string :remember_token

      t.timestamps
    end
  end
end
