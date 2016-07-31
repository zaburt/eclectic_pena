class CreateAlbumCovers < ActiveRecord::Migration
  def change
    create_table :album_covers do |t|
      t.string :name
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
