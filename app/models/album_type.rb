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

class AlbumType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # force friendly_id to update slug
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end

