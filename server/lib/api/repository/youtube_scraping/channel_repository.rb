# frozen_string_literal: true

module Api
  module Repository
    module YoutubeScraping
      class ChannelRepository < BaseRepository
        class << self
          def find(channel_id)
            Api::Response::YoutubeScraping::ChannelFindResponse.new(channel_id: channel_id)
          end
        end
      end
    end
  end
end
