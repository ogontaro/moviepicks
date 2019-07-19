# frozen_string_literal: true

module Api
  module Response
    class VideoSearchResponse < ApplicationResponse
      attr_reader :response_body, :params, :page_token

      def initialize(response_body, part, order, page_token: nil, published_after: nil, published_before: nil)
        @response_body = response_body
        @params = { part: part, order: order, published_after: published_after, published_before: published_after }
        @page_token = page_token
      end

      def next
        @page_token = @response_body.next_page_token
        @response_body = ApplicationResponse.client.list_searches(@params[:part], type: "video", page_token: @response_body.next_page_token, max_results: 50, published_after: params["published_after"], published_before: params["published_before"], order: @params[:order], region_code: "JP", location: "140.526666,35.224144", location_radius: "1000km")
        self
      end

      def result
        @response_body.items.map do |item|
          Api::Entity::VideoEntity.new item.as_json
        end
      end
    end
  end
end