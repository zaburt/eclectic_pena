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

require 'test_helper'

class MusicianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
