class AddImageFilenameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image_filename, :string
  end
end
