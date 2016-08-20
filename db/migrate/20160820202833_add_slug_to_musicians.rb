class AddSlugToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :slug, :string
    add_index :musicians, :slug, unique: true
  end
end
