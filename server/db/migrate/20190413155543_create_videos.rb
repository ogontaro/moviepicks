# frozen_string_literal: true

class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :channel, foreign_key: true
      t.string :video_id, comment: "動画ID"
      t.string :etag_id, comment: "etag ID"
      t.string :title, comment: "動画のタイトル"
      t.string :description, comment: "動画の説明"
      t.datetime :published_at, comment: "動画のアップロード日時"
      t.integer :duration, comment: "動画の長さ(秒)"
      t.integer :view_count, comment: "動画の再生回数"
      t.integer :like_count, comment: "高く評価したユーザの数"
      t.integer :dislike_count, comment: "低く評価したユーザの数"
      t.integer :favorite_count, comment: "お気に入りに登録しているユーザーの数"
      t.integer :comment_count, comment: "動画に対するコメントの数"

      t.timestamps
    end
  end
end
