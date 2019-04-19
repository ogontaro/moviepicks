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
#  index_videos_on_channel_id  (channel_id)
#
# Foreign Keys
#
#  fk_rails_...  (channel_id => channels.id)
#

require "rails_helper"

RSpec.describe Video, type: :response do
  pending "add some examples to (or delete) #{__FILE__}"
end
