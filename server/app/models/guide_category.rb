# frozen_string_literal: true

# == Schema Information
#
# Table name: guide_categories
#
#  id                                       :bigint(8)        not null, primary key
#  title(ガイドカテゴリのタイトル)          :string(255)      not null
#  created_at                               :datetime         not null
#  updated_at                               :datetime         not null
#  channel_id(ガイドカテゴリ用チャンネルID) :string(255)      not null
#  guide_category_id(ガイドカテゴリID)      :string(255)      not null
#


class GuideCategory < ApplicationRecord
  has_many :guide_categories_channels
  has_many :channels, through: :guide_categories_channels
end
