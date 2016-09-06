class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.references :album_type, index: true, foreign_key: true
      t.references :band, index: true, foreign_key: true
      t.date :date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
