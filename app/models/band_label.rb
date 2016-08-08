# == Schema Information
#
# Table name: band_labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BandLabel < ActiveRecord::Base
end
