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

require 'test_helper'

class AlbumTrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
