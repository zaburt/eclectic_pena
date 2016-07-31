class CreateMusicianLabels < ActiveRecord::Migration
  def change
    create_table :musician_labels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
