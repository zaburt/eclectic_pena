class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name
      t.date :birthdate
      t.string :country
      t.text :biography

      t.timestamps null: false
    end
  end
end
