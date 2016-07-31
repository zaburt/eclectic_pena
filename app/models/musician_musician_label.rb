class MusicianMusicianLabel < ActiveRecord::Base
  belongs_to :musician
  belongs_to :musician_label
end
