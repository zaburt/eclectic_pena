class AddAttachmentImageToMusicianPhotos < ActiveRecord::Migration
  def up
    add_attachment :musician_photos, :image
  end

  def down
    remove_attachment :musician_photos, :image
  end
end
