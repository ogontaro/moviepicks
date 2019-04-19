# frozen_string_literal: true

module Api
  module Response
    class ChannelResponse < ApplicationResponse
      attr_reader :response_body

      def initialize(response_body)
        @response_body = response_body
      end

      def next
        @next = ApplicationResponse.client.list_searches("snippet", type: "channel", page_token: @response_body.next_page_token, max_results: 50)
        ChannelResponse.new @next
      end

      def result
        @response_body.items.map do |item|
          Api::Entity::ChannelEntity.new item.as_json["snippet"]
        end
      end
    end
  end
end
