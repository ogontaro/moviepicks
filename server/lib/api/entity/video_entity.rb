# frozen_string_literal: true

module Api
  module Entity
    class VideoEntity < ApplicationEntity
      def initialize(video_hash)
        @video_hash = video_hash
      end

      def to_model
        video = Video.find_or_initialize_by(video_id: @video_hash["id"]["video_id"])
        video.update modelized_hash
        video
      end

      def to_hash
        @video_hash
      end

      private
        def modelized_hash
          hash = @video_hash["snippet"].inject(Hash.new) do |result, item|
            key, value = item
            case key
            when "title" then
              result.store("title", value)
            when "description" then
              result.store("description", value)
            when "published_at" then
              result.store("published_at", value)
            when "channel_id" then
              result.store("channel_id", value)
            end
            result
          end
          hash.store("etag_id", @video_hash["etag"])
          hash
        end
    end
  end
end
