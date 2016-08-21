# == Schema Information
#
# Table name: bands
#
#  id               :integer          not null, primary key
#  name             :string
#  country          :string
#  website          :string
#  biography        :text
#  musician_is_band :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#
# Indexes
#
#  index_bands_on_slug  (slug) UNIQUE
#

class Band < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_paper_trail :class_name => 'BandVersion'

  # force friendly_id to update slug
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end

