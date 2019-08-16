# frozen_string_literal: true

module Api
  module Repository
    class VideoSearchRepository < ApplicationRepository
      class << self
        def all(part: "id,snippet", order: "date", page_token: nil, published_after: nil, published_before: nil)
          Api::Response::VideoSearchResponse.new(
            part: part,
            order: order,
            max_results: 50,
            region_code: "JP",
            page_token: page_token,
            published_after: published_after,
            published_before: published_before,
            location: "140.526666,35.224144",
            location_radius: "1000km"
          )
        end
      end
    end
  end
end
