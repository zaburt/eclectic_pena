class CreateBandLabelsBands < ActiveRecord::Migration
  def change
    create_table :band_labels_bands do |t|
      t.references :band, index: true, foreign_key: true
      t.references :band_label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
