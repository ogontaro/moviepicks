# frozen_string_literal: true

require "rails_helper"

describe Api::Entity::ChannelEntity do
  let(:channel) { Api::Repository::ChannelRepository.find("UC2GuoutVyegg6PUK88lLpjw").result.first } # 兄者弟者

  describe "#to_model" do
    it "return model" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.class).to eq Channel
        expect(channel.to_model.channel_id.class).to eq String
        expect(channel.to_model.title.class).to eq String
        expect(channel.to_model.country.class).to eq String
        expect(channel.to_model.description.class).to eq String
        expect(channel.to_model.published_at.class).to eq ActiveSupport::TimeWithZone
        expect(channel.to_model.view_count.class).to eq Integer
        expect(channel.to_model.subscriber_count.class).to eq Integer
        expect(channel.to_model.video_count.class).to eq Integer
      end
    end
  end

  describe "#to_hash" do
    it "return json object" do
      VCR.use_cassette "api/entity/channel_entity/to_hash", record: :new_episodes do
        expect(channel.to_hash.class).to eq Hash
      end
    end
  end
end
