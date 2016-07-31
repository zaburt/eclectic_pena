class CreateAlbumAlbumLabels < ActiveRecord::Migration
  def change
    create_table :album_album_labels do |t|
      t.references :album, index: true, foreign_key: true
      t.references :album_label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
