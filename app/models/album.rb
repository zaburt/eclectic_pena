# == Schema Information
#
# Table name: albums
#
#  id            :integer          not null, primary key
#  name          :string
#  album_type_id :integer
#  date          :date
#  end_date      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_albums_on_album_type_id  (album_type_id)
#

class Album < ActiveRecord::Base
  belongs_to :album_type
end
