# == Schema Information
#
# Table name: band_versions
#
#  id             :integer          not null, primary key
#  item_type      :string           not null
#  item_id        :integer          not null
#  event          :string           not null
#  whodunnit      :string
#  object         :text
#  object_changes :text
#  created_at     :datetime
#
# Indexes
#
#  index_band_versions_on_item_type_and_item_id  (item_type,item_id)
#

class BandVersion < PaperTrail::Version

  self.table_name = :band_versions

end

