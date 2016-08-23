# == Schema Information
#
# Table name: musicians
#
#  id         :integer          not null, primary key
#  name       :string
#  birthdate  :date
#  country    :string
#  biography  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
# Indexes
#
#  index_musicians_on_slug  (slug) UNIQUE
#

class Musician < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_paper_trail :class_name => 'MusicianVersion'

  has_many :musician_photos, :dependent => :destroy
  has_many :musician_labels_musicians
  has_many :musician_labels, -> {order(:name)}, :through => :musician_labels_musicians, :dependent => :destroy
  has_many :band_musicians
  has_many :bands, -> {order(:name)}, :through => :band_musicians, :dependent => :destroy

  validates_presence_of :name

  # force friendly_id to update slug
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end

