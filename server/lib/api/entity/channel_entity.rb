# frozen_string_literal: true

module Api
  module Entity
    class ChannelEntity < ApplicationEntity
      def initialize(channel_hash)
        @channel_hash = channel_hash
      end

      def to_model
        channel = Channel.find_or_create_by(channel_id: @channel_hash["channel_id"])
        channel.update modelized_hash
        channel
      end

      def to_hash
        @channel_hash
      end

      private

      def modelized_hash
        @channel_hash.inject(Hash.new) do |result, item|
          key, value = item
          case key
          when "title" then
            result.store("title", value)
          when "description" then
            result.store("description", value)
          when "published_at" then
            result.store("published_at", value)
          end
          result
        end
      end
    end
  end
end
