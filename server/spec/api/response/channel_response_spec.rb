# frozen_string_literal: true

require "rails_helper"

describe Api::Response::ChannelResponse do
  let(:response) { Api::Repository::ChannelRepository.all }

  describe "#result" do
    it "return Array of ChannelEntity" do
      expect(response.result.class).to eq Array
      expect(response.result.first.class).to eq Api::Entity::ChannelEntity
    end
  end
end
