# == Schema Information
#
# Table name: album_tracks
#
#  id         :integer          not null, primary key
#  name       :string
#  album_id   :integer
#  tracks     :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_album_tracks_on_album_id  (album_id)
#

class AlbumTrack < ActiveRecord::Base
  belongs_to :album

  scope :for_album, ->(album) {
    where(:album_id => album) if album
  }

end
