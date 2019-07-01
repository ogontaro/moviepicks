# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::ChannelRepository do
  ChannelRepository = Api::Repository::ChannelRepository

  xdescribe "all" do
    let(:channels) { ChannelRepository.all }

    xit "return response" do
      expect(channels.class).to eq Api::Response::ChannelResponse
    end

    context "when use id part" do
      let(:channels) { ChannelRepository.all(part: 'id') }

      it "return response" do
        expect(channels.class).to eq Api::Response::ChannelResponse
      end
    end

    context "when use id page_token" do
      let(:before_channels) { ChannelRepository.all(part: 'id') }
      let(:channels) { ChannelRepository.all(part: 'id', page_token: before_channels.next.page_token) }

      it "return response" do
        expect(channels.class).to eq Api::Response::ChannelResponse
      end
    end
  end
end
