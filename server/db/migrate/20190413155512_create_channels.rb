# frozen_string_literal: true

class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :channel_id, comment: "チャンネルID"
      t.string :etag_id, comment: "etag ID"
      t.string :title, comment: "チャンネルのタイトル"
      t.string :description, comment: "チャンネルの説明"
      t.datetime :published_at, comment: "チャンネルの開設日"
      t.integer :view_count, comment: "チャンネルの再生回数"
      t.integer :comment_count, comment: "チャンネルのコメント数"
      t.integer :subscriber_count, comment: "チャンネルの登録者数"
      t.boolean :hidden_subscriber_count, comment: "チャンネル登録者数を公開表示するかどうかを指定します"

      t.timestamps
    end
  end
end
