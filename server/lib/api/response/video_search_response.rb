# frozen_string_literal: true

module Api
  module Response
    class VideoSearchResponse < ApplicationResponse
      attr_reader :page_token

      def initialize(**params)
        @params = params
        @response = ApplicationResponse.client.list_searches(
            @params[:part],
            type: "video",
            max_results: @params[:max_results],
            order: @params[:order],
            region_code: @params[:region_code],
            page_token: @params[:page_token],
            published_after: @params[:published_after],
            published_before: @params[:published_before],
            location: @params[:location],
            location_radius: @params[:location_radius]
        )
      end

      def next
        @params[:next_page_token] = @response.next_page_token
        VideoSearchResponse.new @params
      end

      def result
        @response.items.map { |item| Api::Entity::VideoEntity.new item.as_json }
      end
    end
  end
end
