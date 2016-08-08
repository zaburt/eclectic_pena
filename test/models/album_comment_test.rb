# == Schema Information
#
# Table name: album_comments
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  user_id    :integer
#  publish    :boolean
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_album_comments_on_album_id  (album_id)
#  index_album_comments_on_user_id   (user_id)
#

require 'test_helper'

class AlbumCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
