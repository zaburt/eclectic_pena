# == Schema Information
#
# Table name: musician_photos
#
#  id                 :integer          not null, primary key
#  name               :string
#  musician_id        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_musician_photos_on_musician_id  (musician_id)
#

require 'test_helper'

class MusicianPhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
