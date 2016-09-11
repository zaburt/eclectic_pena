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

class BandUrl < ActiveRecord::Base
  belongs_to :band

  scope :for_band, ->(band) {
    where(:band_id => band) if band
  }

end

