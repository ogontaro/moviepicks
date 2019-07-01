# frozen_string_literal: true

module Api
  module Response
    class ChannelResponse < ApplicationResponse
      attr_reader :response_body, :params, :page_token

      def initialize(response_body, part, order, page_token: nil)
        @response_body = response_body
        @params = { part: part, order: order }
        @page_token = page_token
      end

      def next
        @page_token = @response_body.next_page_token
        @response_body = ApplicationResponse.client.list_searches(@params[:part], type: "channel", page_token: @response_body.next_page_token, max_results: 50, order: @params[:order], region_code: "JP")
        self
      end

      def result
        @response_body.items.map do |item|
          Api::Entity::ChannelEntity.new item.as_json
        end
      end
    end
  end
end
