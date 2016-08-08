# == Schema Information
#
# Table name: album_musicians
#
#  id          :integer          not null, primary key
#  album_id    :integer
#  musician_id :integer
#  instrument  :string
#  is_guest    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_album_musicians_on_album_id     (album_id)
#  index_album_musicians_on_musician_id  (musician_id)
#

class AlbumMusician < ActiveRecord::Base
  belongs_to :album
  belongs_to :musician
end
