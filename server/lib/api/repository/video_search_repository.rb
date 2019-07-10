# frozen_string_literal: true

module Api
  module Repository
    class VideoSearchRepository < ApplicationRepository
      class << self
        def all(part: "id,snippet", order: "date", page_token: nil, published_after: nil, published_before: nil)
          videos = client.list_searches(part, type: "video", max_results: 50, order: order, region_code: "JP", page_token: page_token, published_after: published_after, published_before: published_before)
          Api::Response::VideoSearchResponse.new(videos, part, order, page_token: page_token, published_after: published_after, published_before: published_before)
        end
      end
    end
  end
end
