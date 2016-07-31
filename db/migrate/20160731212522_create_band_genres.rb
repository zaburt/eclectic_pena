class CreateBandGenres < ActiveRecord::Migration
  def change
    create_table :band_genres do |t|
      t.references :band, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
