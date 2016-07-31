class CreateMusicianPhotos < ActiveRecord::Migration
  def change
    create_table :musician_photos do |t|
      t.string :name
      t.references :musician, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
