# frozen_string_literal: true

# == Schema Information
#
# Table name: guide_categories_channels
#
#  id                  :bigint(8)        not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  channels_id         :bigint(8)
#  guide_categories_id :bigint(8)
#
# Indexes
#
#  index_guide_categories_channels_on_channels_id          (channels_id)
#  index_guide_categories_channels_on_guide_categories_id  (guide_categories_id)
#
# Foreign Keys
#
#  fk_rails_...  (channels_id => channels.id)
#  fk_rails_...  (guide_categories_id => guide_categories.id)
#

FactoryBot.define do
  factory :guide_categories_channel do
  end
end
