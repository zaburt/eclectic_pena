class BandAlbum < ActiveRecord::Base
  belongs_to :band
  belongs_to :album
end
