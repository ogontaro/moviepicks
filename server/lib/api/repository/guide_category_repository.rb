# frozen_string_literal: true

module Api
  module Repository
    class GuideCategoryRepository < ApplicationRepository
      class << self
        def all
          Api::Response::GuideCategoryResponse.new client.list_guide_categories("id,snippet", region_code: "JP")
        end
      end
    end
  end
end
