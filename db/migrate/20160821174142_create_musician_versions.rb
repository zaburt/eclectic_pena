class CreateMusicianVersions < ActiveRecord::Migration
  def change
    create_table :musician_versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id, :null => false
      t.string   :event, :null => false
      t.string   :whodunnit
      t.text     :object
      t.text     :object_changes
      t.datetime :created_at
    end

    add_index :musician_versions, [:item_type, :item_id]
  end
end
