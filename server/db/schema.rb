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

ActiveRecord::Schema.define(version: 2019_04_13_155543) do

  create_table "channels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "channel_id", comment: "チャンネルID"
    t.string "etag_id", comment: "etag ID"
    t.string "title", comment: "チャンネルのタイトル"
    t.string "description", comment: "チャンネルの説明"
    t.datetime "published_at", comment: "チャンネルの開設日"
    t.integer "view_count", comment: "チャンネルの再生回数"
    t.integer "comment_count", comment: "チャンネルのコメント数"
    t.integer "subscriber_count", comment: "チャンネルの登録者数"
    t.boolean "hidden_subscriber_count", comment: "チャンネル登録者数を公開表示するかどうかを指定します"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "channel_id"
    t.string "video_id", comment: "動画ID"
    t.string "etag_id", comment: "etag ID"
    t.string "title", comment: "動画のタイトル"
    t.string "description", comment: "動画の説明"
    t.datetime "published_at", comment: "動画のアップロード日時"
    t.integer "duration", comment: "動画の長さ(秒)"
    t.integer "view_count", comment: "動画の再生回数"
    t.integer "like_count", comment: "高く評価したユーザの数"
    t.integer "dislike_count", comment: "低く評価したユーザの数"
    t.integer "favorite_count", comment: "お気に入りに登録しているユーザーの数"
    t.integer "comment_count", comment: "動画に対するコメントの数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_videos_on_channel_id"
  end

  add_foreign_key "videos", "channels"
end
