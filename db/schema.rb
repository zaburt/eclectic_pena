# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160808201351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_album_labels", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "album_label_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "album_album_labels", ["album_id"], name: "index_album_album_labels_on_album_id", using: :btree
  add_index "album_album_labels", ["album_label_id"], name: "index_album_album_labels_on_album_label_id", using: :btree

  create_table "album_comments", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "user_id"
    t.boolean  "publish"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "album_comments", ["album_id"], name: "index_album_comments_on_album_id", using: :btree
  add_index "album_comments", ["user_id"], name: "index_album_comments_on_user_id", using: :btree

  create_table "album_covers", force: :cascade do |t|
    t.string   "name"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "album_covers", ["album_id"], name: "index_album_covers_on_album_id", using: :btree

  create_table "album_genres", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "album_genres", ["album_id"], name: "index_album_genres_on_album_id", using: :btree
  add_index "album_genres", ["genre_id"], name: "index_album_genres_on_genre_id", using: :btree

  create_table "album_labels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "album_musicians", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "musician_id"
    t.string   "instrument"
    t.boolean  "is_guest"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "album_musicians", ["album_id"], name: "index_album_musicians_on_album_id", using: :btree
  add_index "album_musicians", ["musician_id"], name: "index_album_musicians_on_musician_id", using: :btree

  create_table "album_tracks", force: :cascade do |t|
    t.string   "name"
    t.integer  "album_id"
    t.json     "tracks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "album_tracks", ["album_id"], name: "index_album_tracks_on_album_id", using: :btree

  create_table "album_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.integer  "album_type_id"
    t.date     "date"
    t.date     "end_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "albums", ["album_type_id"], name: "index_albums_on_album_type_id", using: :btree

  create_table "band_band_labels", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "band_label_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "band_band_labels", ["band_id"], name: "index_band_band_labels_on_band_id", using: :btree
  add_index "band_band_labels", ["band_label_id"], name: "index_band_band_labels_on_band_label_id", using: :btree

  create_table "band_genres", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "band_genres", ["band_id"], name: "index_band_genres_on_band_id", using: :btree
  add_index "band_genres", ["genre_id"], name: "index_band_genres_on_genre_id", using: :btree

  create_table "band_labels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "band_musicians", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "musician_id"
    t.date     "since"
    t.date     "until"
    t.boolean  "current"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "band_musicians", ["band_id"], name: "index_band_musicians_on_band_id", using: :btree
  add_index "band_musicians", ["musician_id"], name: "index_band_musicians_on_musician_id", using: :btree

  create_table "band_photos", force: :cascade do |t|
    t.string   "name"
    t.integer  "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "band_photos", ["band_id"], name: "index_band_photos_on_band_id", using: :btree

  create_table "band_urls", force: :cascade do |t|
    t.string   "url"
    t.integer  "band_id"
    t.string   "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "band_urls", ["band_id"], name: "index_band_urls_on_band_id", using: :btree

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "website"
    t.text     "biography"
    t.boolean  "musician_is_band"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musician_labels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musician_musician_labels", force: :cascade do |t|
    t.integer  "musician_id"
    t.integer  "musician_label_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "musician_musician_labels", ["musician_id"], name: "index_musician_musician_labels_on_musician_id", using: :btree
  add_index "musician_musician_labels", ["musician_label_id"], name: "index_musician_musician_labels_on_musician_label_id", using: :btree

  create_table "musician_photos", force: :cascade do |t|
    t.string   "name"
    t.integer  "musician_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "musician_photos", ["musician_id"], name: "index_musician_photos_on_musician_id", using: :btree

  create_table "musicians", force: :cascade do |t|
    t.string   "name"
    t.date     "birthdate"
    t.string   "country"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "album_album_labels", "album_labels"
  add_foreign_key "album_album_labels", "albums"
  add_foreign_key "album_comments", "albums"
  add_foreign_key "album_comments", "users"
  add_foreign_key "album_covers", "albums"
  add_foreign_key "album_genres", "albums"
  add_foreign_key "album_genres", "genres"
  add_foreign_key "album_musicians", "albums"
  add_foreign_key "album_musicians", "musicians"
  add_foreign_key "album_tracks", "albums"
  add_foreign_key "albums", "album_types"
  add_foreign_key "band_band_labels", "band_labels"
  add_foreign_key "band_band_labels", "bands"
  add_foreign_key "band_genres", "bands"
  add_foreign_key "band_genres", "genres"
  add_foreign_key "band_musicians", "bands"
  add_foreign_key "band_musicians", "musicians"
  add_foreign_key "band_photos", "bands"
  add_foreign_key "band_urls", "bands"
  add_foreign_key "musician_musician_labels", "musician_labels"
  add_foreign_key "musician_musician_labels", "musicians"
  add_foreign_key "musician_photos", "musicians"
end
