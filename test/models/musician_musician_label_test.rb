# == Schema Information
#
# Table name: musician_musician_labels
#
#  id                :integer          not null, primary key
#  musician_id       :integer
#  musician_label_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_musician_musician_labels_on_musician_id        (musician_id)
#  index_musician_musician_labels_on_musician_label_id  (musician_label_id)
#

require 'test_helper'

class MusicianMusicianLabelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
