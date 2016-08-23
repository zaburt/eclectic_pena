class AddAttachmentImageToAlbumCovers < ActiveRecord::Migration
  def up
    add_attachment :album_covers, :image
  end

  def down
    remove_attachment :album_covers, :image
  end
end
