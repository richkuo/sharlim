class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:user_id, :created_at]

  end
end
