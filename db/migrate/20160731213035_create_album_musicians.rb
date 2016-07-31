class CreateAlbumMusicians < ActiveRecord::Migration
  def change
    create_table :album_musicians do |t|
      t.references :album, index: true, foreign_key: true
      t.references :musician, index: true, foreign_key: true
      t.string :instrument
      t.boolean :is_guest

      t.timestamps null: false
    end
  end
end
