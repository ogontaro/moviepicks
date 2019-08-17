# frozen_string_literal: true

require "rails_helper"

describe Api::Entity::ChannelEntity do
  let(:channel) { Api::Repository::ChannelRepository.find("UC2GuoutVyegg6PUK88lLpjw").result.first } # 兄者弟者

  describe "#to_model" do
    it "return model" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.class).to eq Channel
      end
    end

    it "returned model has channel_id" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.channel_id.class).to eq String
      end
    end

    it "returned model has title" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.title.class).to eq String
      end
    end

    it "returned model has country" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.country.class).to eq String
      end
    end

    it "returned model has description" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.description.class).to eq String
      end
    end

    it "returned model has published_at" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.title.class).to eq String
      end
    end

    it "returned model has video_count" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.view_count.class).to eq Integer
      end
    end

    it "returned model has subscriber_count" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
        expect(channel.to_model.subscriber_count.class).to eq Integer
      end
    end

    it "returned model has video_count" do
      VCR.use_cassette "api/entity/channel_entity/to_model", record: :new_episodes do
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
