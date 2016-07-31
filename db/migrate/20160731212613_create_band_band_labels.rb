class CreateBandBandLabels < ActiveRecord::Migration
  def change
    create_table :band_band_labels do |t|
      t.references :band, index: true, foreign_key: true
      t.references :band_label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
