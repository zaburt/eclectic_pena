class CreateBandMusicians < ActiveRecord::Migration
  def change
    create_table :band_musicians do |t|
      t.references :band, index: true, foreign_key: true
      t.references :musician, index: true, foreign_key: true
      t.date :since
      t.date :until
      t.boolean :current

      t.timestamps null: false
    end
  end
end
