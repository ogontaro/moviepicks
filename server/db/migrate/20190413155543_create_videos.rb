# frozen_string_literal: true

class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :channel_id, index: true
      t.string :video_id, comment: "動画ID", null: false
      t.string :etag_id, comment: "etag ID", null: false
      t.string :title, comment: "動画のタイトル", null: false
      t.string :description, comment: "動画の説明"
      t.datetime :published_at, comment: "動画のアップロード日時", index: true, null: false
      t.integer :duration, comment: "動画の長さ(秒)"
      t.integer :view_count, comment: "動画の再生回数", index: true
      t.integer :like_count, comment: "高く評価したユーザの数", index: true
      t.integer :dislike_count, comment: "低く評価したユーザの数", index: true
      t.integer :favorite_count, comment: "お気に入りに登録しているユーザーの数", index: true
      t.integer :comment_count, comment: "動画に対するコメントの数", index: true

      t.timestamps
    end

    add_foreign_key :videos, :channels, column: :channel_id, primary_key: "channel_id"
  end
end
