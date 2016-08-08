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
#

class Band < ActiveRecord::Base
end
