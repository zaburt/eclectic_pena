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

require 'test_helper'

class MusicianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
