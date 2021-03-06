# == Schema Information
#
# Table name: albums
#
#  id            :integer          not null, primary key
#  name          :string
#  album_type_id :integer
#  band_id       :integer
#  date          :date
#  end_date      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  slug          :string
#
# Indexes
#
#  index_albums_on_album_type_id  (album_type_id)
#  index_albums_on_band_id        (band_id)
#  index_albums_on_slug           (slug) UNIQUE
#

class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_paper_trail :class_name => 'AlbumVersion'

  belongs_to :album_type
  belongs_to :band

  has_many :album_comments
  has_many :album_covers
  has_many :album_genres
  has_many :genres, -> {order(:name)}, :through => :album_genres, :dependent => :destroy
  has_many :album_labels_albums
  has_many :album_labels, -> {order(:name)}, :through => :album_labels_albums, :dependent => :destroy
  has_many :album_musicians
  has_many :musicians, -> {order(:name)}, :through => :album_musicians, :dependent => :destroy
  has_many :album_tracks

  validates_presence_of :name

  # force friendly_id to update slug
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end

