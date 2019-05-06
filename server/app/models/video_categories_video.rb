# frozen_string_literal: true

# == Schema Information
#
# Table name: video_categories_videos
#
#  id                  :bigint(8)        not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  video_categories_id :bigint(8)
#  videos_id           :bigint(8)
#
# Indexes
#
#  index_video_categories_videos_on_video_categories_id  (video_categories_id)
#  index_video_categories_videos_on_videos_id            (videos_id)
#
# Foreign Keys
#
#  fk_rails_...  (video_categories_id => video_categories.id)
#  fk_rails_...  (videos_id => videos.id)
#


class VideoCategoriesVideo < ApplicationRecord
  belongs_to :video_category
  belongs_to :video
end
