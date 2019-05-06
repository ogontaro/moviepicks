# frozen_string_literal: true

require "rails_helper"

describe Api::Entity::GuideCategoryEntity do
  let(:category) { Api::Repository::GuideCategoryRepository.all.result.first }

  xdescribe "#to_model" do
    it "return model" do
      expect(category.to_model.class).to eq GuideCategory
    end

    it "returned model has guide_category_id" do
      expect(category.to_model.guide_category_id.class).to eq String
    end

    it "returned model has channel_id" do
      expect(category.to_model.channel_id.class).to eq String
    end

    it "returned model has title" do
      expect(category.to_model.title.class).to eq String
    end
  end

  xdescribe "#to_hash" do
    it "return json object" do
      expect(category.to_hash.class).to eq Hash
    end
  end
end
