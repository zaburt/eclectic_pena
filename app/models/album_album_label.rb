class AlbumAlbumLabel < ActiveRecord::Base
  belongs_to :album
  belongs_to :album_label
end
