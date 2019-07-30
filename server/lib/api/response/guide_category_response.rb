# frozen_string_literal: true

module Api
  module Response
    class GuideCategoryResponse < ApplicationResponse
      def initialize(**params)
        @params = params
        @response = ApplicationResponse.client.list_guide_categories(@params[:part], hl: @params[:hl], region_code: @params[:region_code])
      end

      def result
        @response.items.map { |item| Api::Entity::GuideCategoryEntity.new({ id: item.id }.merge item.snippet.to_h) }
      end
    end
  end
end
