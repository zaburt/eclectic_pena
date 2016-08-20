# == Schema Information
#
# Table name: album_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
# Indexes
#
#  index_album_types_on_slug  (slug) UNIQUE
#

require 'test_helper'

class AlbumTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
