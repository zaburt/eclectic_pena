# == Schema Information
#
# Table name: band_musicians
#
#  id          :integer          not null, primary key
#  band_id     :integer
#  musician_id :integer
#  since       :date
#  until       :date
#  current     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_band_musicians_on_band_id      (band_id)
#  index_band_musicians_on_musician_id  (musician_id)
#

require 'test_helper'

class BandMusicianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
