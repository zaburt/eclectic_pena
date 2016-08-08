# == Schema Information
#
# Table name: band_genres
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_band_genres_on_band_id   (band_id)
#  index_band_genres_on_genre_id  (genre_id)
#

require 'test_helper'

class BandGenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
