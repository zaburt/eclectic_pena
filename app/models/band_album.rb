# == Schema Information
#
# Table name: band_albums
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_band_albums_on_album_id  (album_id)
#  index_band_albums_on_band_id   (band_id)
#

class BandAlbum < ActiveRecord::Base
  belongs_to :band
  belongs_to :album
end
