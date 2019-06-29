# frozen_string_literal: true

# == Schema Information
#
# Table name: video_categories
#
#  id                                  :bigint(8)        not null, primary key
#  title(ビデオカテゴリのタイトル)     :string(255)      not null
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  video_category_id(ビデオカテゴリID) :string(255)      not null
#

FactoryBot.define do
  factory :video_category do
  end
end
