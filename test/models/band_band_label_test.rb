# == Schema Information
#
# Table name: band_band_labels
#
#  id            :integer          not null, primary key
#  band_id       :integer
#  band_label_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_band_band_labels_on_band_id        (band_id)
#  index_band_band_labels_on_band_label_id  (band_label_id)
#

require 'test_helper'

class BandBandLabelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
