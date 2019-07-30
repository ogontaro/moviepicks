# frozen_string_literal: true

module Api
  module Repository
    class ChannelSearchRepository < ApplicationRepository
      class << self
        def all(part: "id,snippet", order: "date", page_token: nil, published_after: nil, published_before: nil)
          Api::Response::ChannelSearchResponse.new(
              part: part,
              order: order,
              page_token: page_token,
              published_after: published_after,
              published_before: published_before,
              max_results: 50,
              region_code: "JP"
          )
        end
      end
    end
  end
end
