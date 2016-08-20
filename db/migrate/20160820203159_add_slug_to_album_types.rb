class AddSlugToAlbumTypes < ActiveRecord::Migration
  def change
    add_column :album_types, :slug, :string
    add_index :album_types, :slug, unique: true
  end
end
