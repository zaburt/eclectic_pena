class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :country
      t.string :website
      t.text :biography
      t.boolean :musician_is_band

      t.timestamps null: false
    end
  end
end
