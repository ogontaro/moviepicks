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

require "rails_helper"

RSpec.describe GuideCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
