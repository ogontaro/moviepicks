# frozen_string_literal: true

# == Schema Information
#
# Table name: channels
#
#  id                                                                            :bigint(8)        not null, primary key
#  comment_count(チャンネルのコメント数)                                         :integer
#  country(チャンネルの登録国)                                                   :string(255)
#  description(チャンネルの説明)                                                 :text(65535)
#  hidden_subscriber_count(チャンネル登録者数を公開表示するかどうかを指定します) :boolean
#  published_at(チャンネルの開設日)                                              :datetime         not null
#  subscriber_count(チャンネルの登録者数)                                        :bigint(8)
#  title(チャンネルのタイトル)                                                   :string(255)      not null
#  video_count(チャンネルのビデオ数)                                             :bigint(8)
#  view_count(チャンネルの再生回数)                                              :bigint(8)
#  created_at                                                                    :datetime         not null
#  updated_at                                                                    :datetime         not null
#  channel_id(チャンネルID)                                                      :string(255)      not null
#  etag_id(etag ID)                                                              :string(255)      not null
#
# Indexes
#
#  index_channels_on_channel_id        (channel_id)
#  index_channels_on_comment_count     (comment_count)
#  index_channels_on_published_at      (published_at)
#  index_channels_on_subscriber_count  (subscriber_count)
#  index_channels_on_video_count       (video_count)
#  index_channels_on_view_count        (view_count)
#

FactoryBot.define do
  factory :channel do
  end
end
