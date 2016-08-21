class CreateAlbumLabelsAlbums < ActiveRecord::Migration
  def change
    create_table :album_labels_albums do |t|
      t.references :album, index: true, foreign_key: true
      t.references :album_label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
