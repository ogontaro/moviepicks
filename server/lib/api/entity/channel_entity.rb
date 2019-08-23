# frozen_string_literal: true

module Api
  module Entity
    class ChannelEntity < ApplicationEntity
      def initialize(channel_hash)
        @channel_hash = channel_hash
      end

      def to_model
        channel = Channel.find_or_initialize_by(channel_id: @channel_hash["id"])
        channel.update modelized_hash
        channel
      end

      def to_hash
        @channel_hash
      end

      private
        def modelized_hash
          hash = {}
          hash.merge!(@channel_hash["snippet"].inject(Hash.new) do |result, item|
            key, value = item
            case key
            when "title" then
              result.store("title", value)
            when "country" then
              result.store("country", value)
            when "description" then
              result.store("description", value)
            when "published_at" then
              result.store("published_at", value)
            end
            result
          end
          ) if @channel_hash["snippet"]

          hash.merge!(@channel_hash["statistics"].inject(Hash.new) do |result, item|
            key, value = item
            case key
            when "view_count" then
              result.store("view_count", value)
            when "subscriber_count" then
              result.store("subscriber_count", value)
            when "video_count" then
              result.store("video_count", value)
            end
            result
          end
          ) if @channel_hash["statistics"]
          hash.store("channel_id", @channel_hash["id"])
          hash.store("etag_id", @channel_hash["etag"])
          hash
        end
    end
  end
end
