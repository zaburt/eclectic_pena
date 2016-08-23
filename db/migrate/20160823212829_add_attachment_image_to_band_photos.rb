class AddAttachmentImageToBandPhotos < ActiveRecord::Migration
  def up
    add_attachment :band_photos, :image
  end

  def down
    remove_attachment :band_photos, :image
  end
end
