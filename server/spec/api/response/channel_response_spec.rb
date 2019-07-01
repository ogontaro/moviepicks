# frozen_string_literal: true

require "rails_helper"

describe Api::Response::ChannelResponse do
  let(:response) { Api::Repository::ChannelRepository.all }

  xdescribe "#result" do
    it "return Array of ChannelEntity" do
      expect(response.result.class).to eq Array
      expect(response.result.first.class).to eq Api::Entity::ChannelEntity
    end
  end

  xdescribe "#next" do
    before { response.next }

    it "get next page" do
      expect(response.class).to eq Api::Response::ChannelResponse
    end

    it "has page token" do
      expect(response.page_token).not_to be nil
    end
  end
end
