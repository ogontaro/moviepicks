# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::GuideCategoryRepository do
  GuideCategoryRepository = Api::Repository::GuideCategoryRepository

  describe "all" do
    let(:categories) { GuideCategoryRepository.all }

    xit "return response" do
      # expect(categories.class).to eq Api::Response::GuideCategoryResponse
      expect(categories.class).to eq Api::Response::GuideCategoryResponse
    end
  end
end
