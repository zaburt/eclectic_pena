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

  has_many :band_photos
  has_many :band_urls
  has_many :band_genres
  has_many :albums, :dependent => :destroy
  has_many :genres, -> {order(:name)}, :through => :band_genres, :dependent => :destroy
  has_many :band_musicians
  has_many :musicians, -> {order(:name)}, :through => :band_musicians, :dependent => :destroy
  has_many :band_labels_bands
  has_many :band_labels, -> {order(:name)}, :through => :band_labels_bands, :dependent => :destroy

  validates_presence_of :name


  def related_bands
    Band.joins(:band_musicians).where('bands.id != ?', id)
        .where('band_musicians.musician_id' => musician_ids).uniq
  end

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

