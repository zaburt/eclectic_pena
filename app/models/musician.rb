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
end
