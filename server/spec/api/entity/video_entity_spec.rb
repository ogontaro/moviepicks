# frozen_string_literal: true

require "rails_helper"

describe Api::Entity::VideoEntity do
  let(:video) { Api::Repository::VideoSearchRepository.all.result.first }

  describe "#to_model" do
    it "return model" do
      VCR.use_cassette "api/entity/video_entity/to_model", record: :new_episodes do
        expect(video.to_model.class).to eq Video
      end
    end

    it "returned model has video_id" do
      VCR.use_cassette "api/entity/video_entity/to_model", record: :new_episodes do
        expect(video.to_model.video_id.class).to eq String
      end
    end

    it "returned model has title" do
      VCR.use_cassette "api/entity/video_entity/to_model", record: :new_episodes do
        expect(video.to_model.title.class).to eq String
      end
    end

    it "returned model has description" do
      VCR.use_cassette "api/entity/video_entity/to_model", record: :new_episodes do
        expect(video.to_model.description.class).to eq String
      end
    end

    it "returned model has published_at" do
      VCR.use_cassette "api/entity/video_entity/to_model", record: :new_episodes do
        expect(video.to_model.title.class).to eq String
      end
    end
  end

  describe "#to_hash" do
    it "return json object" do
      VCR.use_cassette "api/entity/video_entity/to_hash", record: :new_episodes do
        expect(video.to_hash.class).to eq Hash
      end
    end
  end
end
