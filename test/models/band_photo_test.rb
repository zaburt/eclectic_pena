# == Schema Information
#
# Table name: band_photos
#
#  id         :integer          not null, primary key
#  name       :string
#  band_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_band_photos_on_band_id  (band_id)
#

require 'test_helper'

class BandPhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
