# frozen_string_literal: true

module Api
  module Response
    class GuideCategoryResponse < ApplicationResponse
      attr_reader :response_body

      def initialize(response_body)
        @response_body = response_body
      end

      def next
        ChannelResponse.new ApplicationResponse.client.list_guide_categories("id,snippet", page_token: @response_body.next_page_token, region_code: "JP")
      end

      def result
        @response_body.items.map do |item|
          Api::Entity::GuideCategoryEntity.new({ id: item.id }.merge item.snippet.to_h)
        end
      end
    end
  end
end
