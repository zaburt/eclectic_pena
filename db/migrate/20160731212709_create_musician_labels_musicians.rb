class CreateMusicianLabelsMusicians < ActiveRecord::Migration
  def change
    create_table :musician_labels_musicians do |t|
      t.references :musician, index: true, foreign_key: true
      t.references :musician_label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
