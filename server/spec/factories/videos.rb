# frozen_string_literal: true

# == Schema Information
#
# Table name: videos
#
#  id                                                   :bigint(8)        not null, primary key
#  comment_count(動画に対するコメントの数)              :integer
#  description(動画の説明)                              :string(255)
#  dislike_count(低く評価したユーザの数)                :integer
#  duration(動画の長さ(秒))                             :integer
#  favorite_count(お気に入りに登録しているユーザーの数) :integer
#  like_count(高く評価したユーザの数)                   :integer
#  published_at(動画のアップロード日時)                 :datetime         not null
#  title(動画のタイトル)                                :string(255)      not null
#  view_count(動画の再生回数)                           :integer
#  created_at                                           :datetime         not null
#  updated_at                                           :datetime         not null
#  channel_id                                           :string(255)
#  etag_id(etag ID)                                     :string(255)      not null
#  video_id(動画ID)                                     :string(255)      not null
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
#  fk_rails_...  (channel_id => channels.channel_id)
#

FactoryBot.define do
  factory :video do
  end
end
