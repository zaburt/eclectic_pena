# == Schema Information
#
# Table name: album_covers
#
#  id                 :integer          not null, primary key
#  name               :string
#  album_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_album_covers_on_album_id  (album_id)
#

require 'test_helper'

class AlbumCoverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
