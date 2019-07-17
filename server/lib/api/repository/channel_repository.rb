# frozen_string_literal: true

module Api
  module Repository
    class ChannelRepository < ApplicationRepository
      class << self
        def find(channel_id, part: "id,snippet")
          channels = client.list_channels(part, id: channel_id)
          Api::Response::ChannelResponse.new(channels)
        end
      end
    end
  end
end
