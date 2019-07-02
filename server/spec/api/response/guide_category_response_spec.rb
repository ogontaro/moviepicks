# frozen_string_literal: true

require "rails_helper"

describe Api::Response::GuideCategoryResponse do
  let(:response) { Api::Repository::GuideCategoryRepository.all }

  describe "#result" do
    it "return Array of GuideCategoryEntity" do
      VCR.use_cassette 'api/response/guide_category_repository/result', record: :new_episodes do
        expect(response.result.class).to eq Array
        expect(response.result.first.class).to eq Api::Entity::GuideCategoryEntity
      end
    end
  end
end
