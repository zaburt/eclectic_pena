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

class MusicianMusicianLabel < ActiveRecord::Base
  belongs_to :musician
  belongs_to :musician_label
end
