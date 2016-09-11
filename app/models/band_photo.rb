# == Schema Information
#
# Table name: band_photos
#
#  id                 :integer          not null, primary key
#  name               :string
#  band_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_band_photos_on_band_id  (band_id)
#

class BandPhoto < ActiveRecord::Base
  belongs_to :band

  has_attached_file :image,
                    :styles => {
                      :medium => '600x600>',
                      :small => '300x300>',
                      :thumb => '100x100>'
                    },
                    # url: '/media/:class/:attachment/:id_partition/:style/:filename',
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\Z}
  validates_attachment_file_name :image, matches: [/png\Z/i, /jpe?g\Z/i, /gif\Z/i]

  scope :for_band, ->(band) {
    where(:band_id => band) if band
  }

end

