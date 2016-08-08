# == Schema Information
#
# Table name: album_album_labels
#
#  id             :integer          not null, primary key
#  album_id       :integer
#  album_label_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_album_album_labels_on_album_id        (album_id)
#  index_album_album_labels_on_album_label_id  (album_label_id)
#

class AlbumAlbumLabel < ActiveRecord::Base
  belongs_to :album
  belongs_to :album_label
end
