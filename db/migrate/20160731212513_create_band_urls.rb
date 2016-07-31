class CreateBandUrls < ActiveRecord::Migration
  def change
    create_table :band_urls do |t|
      t.string :url
      t.references :band, index: true, foreign_key: true
      t.string :description
      t.date :date

      t.timestamps null: false
    end
  end
end
