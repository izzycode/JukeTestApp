class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :genre

      t.timestamps
    end
    add_attachment :playlists, :xml_file
  end
end
