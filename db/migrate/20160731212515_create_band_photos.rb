class CreateBandPhotos < ActiveRecord::Migration
  def change
    create_table :band_photos do |t|
      t.string :name
      t.references :band, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
