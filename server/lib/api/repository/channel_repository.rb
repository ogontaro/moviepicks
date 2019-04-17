# frozen_string_literal: true

module Api
  module Repository
    class ChannelRepository < ApplicationRepository
      class << self
        def all
          client.list_searches("id,snippet", type: "channel", order: "date", max_results: 50)
        end
      end
    end
  end
end
