class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :image_url
      t.string :genre
      t.string :bit_rate
      t.string :sample_rate
      t.string :normalization

      t.timestamps
    end
    add_column :songs, :playlist_id, :integer

  end
end
