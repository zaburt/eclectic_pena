class AlbumComment < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
end
