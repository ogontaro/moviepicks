# frozen_string_literal: true

require "rails_helper"

describe Api::Entity::YoutubeScraping::ChannelEntity do
  let(:channel) { Api::Repository::YoutubeScraping::ChannelRepository.find("UC2GuoutVyegg6PUK88lLpjw").result } # 兄者弟者

  describe "#to_model" do
    let(:model) { channel.to_model }
    it "return model" do
      VCR.use_cassette "api/entity/youtube_scraping/channel_entity/to_model", record: :new_episodes do
        expect(model.class).to eq Channel
        expect(model.channel_id.class).to eq String
        expect(model.title.class).to eq String
        expect(model.country.class).to eq String
        expect(model.description.class).to eq String
        expect(model.published_at.class).to eq ActiveSupport::TimeWithZone
        expect(model.view_count.class).to eq Integer
        expect(model.subscriber_count.class).to eq Integer
        expect(model.video_count.class).to eq Integer
      end
    end
  end

  describe "#to_hash" do
    it "return json object" do
      VCR.use_cassette "api/entity/youtube_scraping/channel_entity/to_hash", record: :new_episodes do
        expect(channel.to_hash.class).to eq Hash
      end
    end
  end
end
