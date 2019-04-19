# frozen_string_literal: true

require "rails_helper"

describe Api::Entity::ChannelEntity do
  let(:channel) { Api::Repository::ChannelRepository.all.result.first }

  xdescribe "#to_model" do
    it "return model" do
      expect(channel.to_model.class).to eq Channel
    end

    it "returned model has channel_id" do
      expect(channel.to_model.channel_id.class).to eq String
    end

    it "returned model has title" do
      expect(channel.to_model.title.class).to eq String
    end

    it "returned model has description" do
      expect(channel.to_model.description.class).to eq String
    end

    it "returned model has published_at" do
      expect(channel.to_model.title.class).to eq String
    end
  end

  xdescribe "#to_hash" do
    it "return json object" do
      expect(channel.to_hash.class).to eq Hash
    end
  end
end
