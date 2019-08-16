# frozen_string_literal: true

module Api
  module Response
    class ChannelSearchResponse < ApplicationResponse
      attr_reader :page_token

      def initialize(**params)
        @params = params
        @response = ApplicationResponse.client.list_searches(
          @params[:part],
            type: "channel",
            max_results: @params[:max_results],
            order: @params[:order],
            region_code: @params[:region_code],
            page_token: @params[:page_token],
            published_after: @params[:published_after],
            published_before: @params[:published_before]
        )
      end

      def next
        @params[:page_token] = @response.next_page_token
        ChannelSearchResponse.new @params
      end

      def result
        @response.items.map { |item| Api::Entity::ChannelSearchEntity.new item.as_json }
      end
    end
  end
end
