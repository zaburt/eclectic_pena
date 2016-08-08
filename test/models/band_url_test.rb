# == Schema Information
#
# Table name: band_urls
#
#  id          :integer          not null, primary key
#  url         :string
#  band_id     :integer
#  description :string
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_band_urls_on_band_id  (band_id)
#

require 'test_helper'

class BandUrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
