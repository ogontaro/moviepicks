# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::GuideCategoryRepository do
  GuideCategoryRepository = Api::Repository::GuideCategoryRepository
  GuideCategoryResponse= Api::Response::GuideCategoryResponse

  describe "all" do
    let(:categories) { GuideCategoryRepository.all }

    it "return response" do
      VCR.use_cassette "api/repository/guide_category_repository/all", record: :new_episodes do
        expect(categories.class).to eq GuideCategoryResponse
      end
    end
  end
end
