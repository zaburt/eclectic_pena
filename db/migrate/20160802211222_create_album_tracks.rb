class CreateAlbumTracks < ActiveRecord::Migration
  def change
    create_table :album_tracks do |t|
      t.string :name
      t.references :album, index: true, foreign_key: true
      t.json :tracks

      t.timestamps null: false
    end
  end
end
