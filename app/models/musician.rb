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
#

class Musician < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # force friendly_id to update slug
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end

