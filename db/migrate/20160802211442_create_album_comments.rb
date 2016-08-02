class CreateAlbumComments < ActiveRecord::Migration
  def change
    create_table :album_comments do |t|
      t.references :album, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :publish
      t.text :comment

      t.timestamps null: false
    end
  end
end
