# frozen_string_literal: true

# == Schema Information
#
# Table name: videos
#
#  id                                 :bigint(8)        not null, primary key
#  comment_count(動画に対するコメントの数)        :integer
#  description(動画の説明)                 :string(255)
#  dislike_count(低く評価したユーザの数)         :integer
#  duration(動画の長さ(秒))                 :integer
#  favorite_count(お気に入りに登録しているユーザーの数) :integer
#  like_count(高く評価したユーザの数)            :integer
#  published_at(動画のアップロード日時)          :datetime
#  title(動画のタイトル)                     :string(255)
#  view_count(動画の再生回数)                :integer
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  channel_id                         :bigint(8)
#  etag_id(etag ID)                   :string(255)
#  video_id(動画ID)                     :string(255)
#
# Indexes
#
#  index_videos_on_channel_id      (channel_id)
#  index_videos_on_comment_count   (comment_count)
#  index_videos_on_dislike_count   (dislike_count)
#  index_videos_on_favorite_count  (favorite_count)
#  index_videos_on_like_count      (like_count)
#  index_videos_on_published_at    (published_at)
#  index_videos_on_view_count      (view_count)
#
# Foreign Keys
#
#  fk_rails_...  (channel_id => channels.id)
#

class Video < ApplicationRecord
  has_many :video_categories_videos
  has_many :categories, through: :video_categories_videos, class_name: "VideoCategory", source: :video_category

  belongs_to :channel
end
