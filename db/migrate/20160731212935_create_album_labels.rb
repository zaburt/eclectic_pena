class CreateAlbumLabels < ActiveRecord::Migration
  def change
    create_table :album_labels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
