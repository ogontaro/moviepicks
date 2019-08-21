# frozen_string_literal: true

module Api
  module Entity
    module YoutubeScraping
      class ChannelEntity < ApplicationEntity
        def initialize(channel_hash)
          @channel_hash = channel_hash
        end

        def to_model
          channel = Channel.find_or_initialize_by(channel_id: @channel_hash[:channel_id])
          channel.update @channel_hash
          channel
        end

        def to_hash
          @channel_hash
        end
      end
    end
  end
end
