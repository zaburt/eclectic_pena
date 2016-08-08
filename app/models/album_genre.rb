# == Schema Information
#
# Table name: album_genres
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_album_genres_on_album_id  (album_id)
#  index_album_genres_on_genre_id  (genre_id)
#

class AlbumGenre < ActiveRecord::Base
  belongs_to :album
  belongs_to :genre
end
