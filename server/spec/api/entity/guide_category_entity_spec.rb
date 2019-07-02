# frozen_string_literal: true

require "rails_helper"

describe Api::Entity::GuideCategoryEntity do
  let(:category) { Api::Repository::GuideCategoryRepository.all.result.first }

  describe "#to_model" do
    it "return model" do
      VCR.use_cassette "api/entity/guide_category_entity/to_model", record: :new_episodes do
        expect(category.to_model.class).to eq GuideCategory
      end
    end

    it "returned model has guide_category_id" do
      VCR.use_cassette "api/entity/guide_category_entity/to_model", record: :new_episodes do
        expect(category.to_model.guide_category_id.class).to eq String
      end
    end

    it "returned model has channel_id" do
      VCR.use_cassette "api/entity/guide_category_entity/to_model", record: :new_episodes do
        expect(category.to_model.channel_id.class).to eq String
      end
    end

    it "returned model has title" do
      VCR.use_cassette "api/entity/guide_category_entity/to_model", record: :new_episodes do
        expect(category.to_model.title.class).to eq String
      end
    end
  end

  describe "#to_hash" do
    it "return json object" do
      VCR.use_cassette "api/entity/guide_category_entity/to_hash", record: :new_episodes do
        expect(category.to_hash.class).to eq Hash
      end
    end
  end
end
