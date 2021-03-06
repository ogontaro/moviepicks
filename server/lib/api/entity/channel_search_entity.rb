# frozen_string_literal: true

module Api
  module Entity
    class ChannelSearchEntity < ApplicationEntity
      def initialize(channel_hash)
        @channel_hash = channel_hash
      end

      def to_model
        channel = Channel.find_or_initialize_by(channel_id: @channel_hash["id"]["channel_id"])
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
            when "description" then
              result.store("description", value)
            when "published_at" then
              result.store("published_at", value)
            end
            result
          end
          ) if @channel_hash["snippet"]
          hash.store("channel_id", @channel_hash["id"]["channel_id"])
          hash.store("etag_id", @channel_hash["etag"])
          hash
        end
    end
  end
end
