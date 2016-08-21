# == Schema Information
#
# Table name: musician_versions
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
#  index_musician_versions_on_item_type_and_item_id  (item_type,item_id)
#

class MusicianVersion < PaperTrail::Version

  self.table_name = :musician_versions

end

