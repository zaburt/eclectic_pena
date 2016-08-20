class CreateBandAlbums < ActiveRecord::Migration
  def change
    create_table :band_albums do |t|
      t.references :band, index: true, foreign_key: true
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
