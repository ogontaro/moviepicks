# frozen_string_literal: true

module Api
  module Repository
    class ChannelSearchRepository < ApplicationRepository
      class << self
        def all(part: "id,snippet", order: "date", page_token: nil, published_after: nil, published_before: nil)
          channels = client.list_searches(part, type: "channel", max_results: 50, order: order, region_code: "JP", page_token: page_token, published_after: published_after, published_before: published_before)
          Api::Response::ChannelSearchResponse.new(channels, part, order, page_token: page_token, published_after: published_after, published_before: published_before)
        end
      end
    end
  end
end
