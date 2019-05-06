# frozen_string_literal: true

# == Schema Information
#
# Table name: channels
#
#  id                                                  :bigint(8)        not null, primary key
#  comment_count(チャンネルのコメント数)                          :integer
#  description(チャンネルの説明)                               :string(255)
#  hidden_subscriber_count(チャンネル登録者数を公開表示するかどうかを指定します) :boolean
#  published_at(チャンネルの開設日)                             :datetime
#  subscriber_count(チャンネルの登録者数)                        :integer
#  title(チャンネルのタイトル)                                   :string(255)
#  view_count(チャンネルの再生回数)                              :integer
#  created_at                                          :datetime         not null
#  updated_at                                          :datetime         not null
#  channel_id(チャンネルID)                                 :string(255)
#  etag_id(etag ID)                                    :string(255)
#
# Indexes
#
#  index_channels_on_comment_count     (comment_count)
#  index_channels_on_published_at      (published_at)
#  index_channels_on_subscriber_count  (subscriber_count)
#  index_channels_on_view_count        (view_count)
#

class Channel < ApplicationRecord
  has_many :guide_categories_channels
  has_many :categories, through: :guide_categories_channels, class_name: "GuideCategory", source: :guide_category

  has_many :videos, dependent: :destroy
end
