# == Schema Information
#
# Table name: album_versions
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
#  index_album_versions_on_item_type_and_item_id  (item_type,item_id)
#

class AlbumVersion < PaperTrail::Version

  self.table_name = :album_versions

end

