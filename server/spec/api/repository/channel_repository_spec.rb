# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::ChannelRepository do
  ChannelRepository = Api::Repository::ChannelRepository

  describe "all" do
    let(:channels) { ChannelRepository.all }

    xit "return response" do
      expect(channels.class).to eq Api::Response::ChannelResponse
    end
  end
end
