# frozen_string_literal: true

module Api
  module Response
    class ChannelResponse < ApplicationResponse
      attr_reader :page_token

      def initialize(**params)
        @params = params
        @response = ApplicationResponse.client.list_searches(@params[:part], channel_id: params[:channel_id])
      end

      def result
        @response.items.map { |item| Api::Entity::ChannelEntity.new item.as_json }
      end
    end
  end
end
