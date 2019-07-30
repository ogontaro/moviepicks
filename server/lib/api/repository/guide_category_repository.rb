# frozen_string_literal: true

module Api
  module Repository
    class GuideCategoryRepository < ApplicationRepository
      class << self
        def all
          Api::Response::GuideCategoryResponse.new(part: "id,snippet", region_code: "JP", hl: "ja-JP")
        end
      end
    end
  end
end
