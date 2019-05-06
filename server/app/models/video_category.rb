# frozen_string_literal: true

# == Schema Information
#
# Table name: video_categories
#
#  id                           :bigint(8)        not null, primary key
#  title(ビデオカテゴリのタイトル)          :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  video_category_id(ビデオカテゴリID) :string(255)
#


class VideoCategory < ApplicationRecord
  has_many :video_categories_videos
  has_many :videos, through: :video_categories_videos
end
