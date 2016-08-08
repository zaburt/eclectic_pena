# == Schema Information
#
# Table name: musician_labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MusicianLabel < ActiveRecord::Base
end
