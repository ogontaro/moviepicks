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

require "rails_helper"

RSpec.describe VideoCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
