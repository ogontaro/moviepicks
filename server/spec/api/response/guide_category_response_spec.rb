# frozen_string_literal: true

require "rails_helper"

describe Api::Response::GuideCategoryResponse do
  let(:response) { Api::Repository::GuideCategoryRepository.all }

  describe "#result" do
    xit "return Array of GuideCategoryEntity" do
      expect(response.result.class).to eq Array
      expect(response.result.first.class).to eq Api::Entity::GuideCategoryEntity
    end
  end
end
