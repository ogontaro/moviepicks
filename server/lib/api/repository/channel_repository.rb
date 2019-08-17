# frozen_string_literal: true

module Api
  module Repository
    class ChannelRepository < ApplicationRepository
      class << self
        def find(channel_id, part: "id,snippet,statistics")
          Api::Response::ChannelResponse.new(part: part, channel_id: channel_id)
        end
      end
    end
  end
end
