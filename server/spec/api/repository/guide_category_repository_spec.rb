# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::GuideCategoryRepository do
  GuideCategoryRepository = Api::Repository::GuideCategoryRepository
  GuideCategoryResponse = Api::Response::GuideCategoryResponse

  describe "all" do
    let(:response) { GuideCategoryRepository.all }
    let(:categories) { response.result }

    it "return response" do
      VCR.use_cassette "api/repository/guide_category_repository/all", record: :new_episodes do
        expect(response.class).to eq GuideCategoryResponse
        expect(categories.class).to eq Array
      end
    end
  end
end
