# frozen_string_literal: true

module Api
  module Response
    class ChannelResponse < ApplicationResponse
      attr_reader :response_body, :params, :page_token

      def initialize(response_body)
        @response_body = response_body
      end

      def result
        @response_body.items.map do |item|
          Api::Entity::ChannelEntity.new item.as_json
        end
      end
    end
  end
end
