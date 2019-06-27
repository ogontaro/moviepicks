# frozen_string_literal: true

module Api
  module Entity
    class GuideCategoryEntity < ApplicationEntity
      def initialize(guide_category_hash)
        @guide_category_hash = guide_category_hash
      end

      def to_model
        category = GuideCategory.find_or_initialize_by(guide_category_id: modelized_hash["guide_category_id"])
        category.assign_attributes modelized_hash
        category
      end

      def to_hash
        @guide_category_hash
      end

      private

      def modelized_hash
        @guide_category_hash.inject(Hash.new) do |result, item|
          key, value = item
          case key
          when :id then
            result.store("guide_category_id", value)
          when :channel_id then
            result.store("channel_id", value)
          when :title then
            result.store("title", value)
          end
          result
        end
      end
    end
  end
end
