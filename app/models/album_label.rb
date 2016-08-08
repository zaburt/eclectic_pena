# == Schema Information
#
# Table name: album_labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AlbumLabel < ActiveRecord::Base
end
