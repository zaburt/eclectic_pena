class CreateAlbumGenres < ActiveRecord::Migration
  def change
    create_table :album_genres do |t|
      t.references :album, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
