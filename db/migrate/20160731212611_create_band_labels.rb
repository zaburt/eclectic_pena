class CreateBandLabels < ActiveRecord::Migration
  def change
    create_table :band_labels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
