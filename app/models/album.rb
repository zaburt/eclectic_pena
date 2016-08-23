# == Schema Information
#
# Table name: albums
#
#  id            :integer          not null, primary key
#  name          :string
#  album_type_id :integer
#  date          :date
#  end_date      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  slug          :string
#
# Indexes
#
#  index_albums_on_album_type_id  (album_type_id)
#  index_albums_on_slug           (slug) UNIQUE
#

class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_paper_trail :class_name => 'AlbumVersion'

  belongs_to :album_type

  has_many :album_comments
  has_many :album_covers
  has_many :album_genres
  has_many :genres, -> {order(:name)}, :through => :album_genres, :dependent => :destroy
  has_many :album_labels_albums
  has_many :album_labels, -> {order(:name)}, :through => :album_labels_albums, :dependent => :destroy
  has_many :album_musicians
  has_many :musicians, -> {order(:name)}, :through => :album_musicians, :dependent => :destroy
  has_many :album_tracks

  has_one :band_album
  has_one :band, :through => :band_album


  # force friendly_id to update slug
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end

