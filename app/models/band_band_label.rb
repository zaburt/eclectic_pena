class BandBandLabel < ActiveRecord::Base
  belongs_to :band
  belongs_to :band_label
end
