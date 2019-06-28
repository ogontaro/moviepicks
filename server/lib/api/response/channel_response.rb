# frozen_string_literal: true

module Api
  module Response
    class ChannelResponse < ApplicationResponse
      attr_reader :response_body, :params

      def initialize(response_body, part, order)
        @response_body = response_body
        @params = { part: part, order: order}
      end

      def next
        @next = ApplicationResponse.client.list_searches(@params[:part], type: "channel", page_token: @response_body.next_page_token, max_results: 50, order: @params[:order], region_code: "JP")
        ChannelResponse.new @next, @params[:part], @params[:order]
      end

      def result
        @response_body.items.map do |item|
          Api::Entity::ChannelEntity.new item.as_json["snippet"]
        end
      end
    end
  end
end
