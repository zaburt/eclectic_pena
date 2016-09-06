# == Schema Information
#
# Table name: musicians
#
#  id         :integer          not null, primary key
#  name       :string
#  birthdate  :date
#  country    :string
#  website    :string
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
  has_many :album_musicians
  has_many :albums, -> {order(:name)}, :through => :album_musicians, :dependent => :destroy

  validates_presence_of :name

  # force friendly_id to update slug
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def country_name
    return '' if country.blank?
    country_obj = ISO3166::Country[country]
    country_obj.translations[I18n.locale.to_s] || country_obj.name
  end

end

