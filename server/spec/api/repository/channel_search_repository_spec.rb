# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::ChannelSearchRepository do
  ChannelSearchRepository = Api::Repository::ChannelSearchRepository
  ChannelSearchResponse = Api::Response::ChannelSearchResponse

  describe "all" do
    let(:channels) { ChannelSearchRepository.all }

    it "return response" do
      VCR.use_cassette "api/repository/channel_search_repository/all", record: :new_episodes  do
        expect(channels.class).to eq ChannelSearchResponse
      end
    end

    context "when use id part" do
      let(:channels) { ChannelSearchRepository.all(part: "id") }

      it "return response" do
        VCR.use_cassette "api/repository/channel_search_repository/all", record: :new_episodes do
          expect(channels.class).to eq ChannelSearchResponse
        end
      end
    end

    context "when use id page_token" do
      let(:before_channels) { ChannelSearchRepository.all(part: "id") }
      let(:channels) { ChannelSearchRepository.all(part: "id", page_token: before_channels.next.page_token) }

      it "return response" do
        VCR.use_cassette "api/repository/channel_search_repository/all", record: :new_episodes do
          expect(channels.class).to eq ChannelSearchResponse
        end
      end
    end

    context "when use published_after" do
      let(:channels) { ChannelSearchRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/channel_search_repository/all", record: :new_episodes do
          expect(channels.class).to eq ChannelSearchResponse
        end
      end
    end

    context "when use published_before" do
      let(:channels) { ChannelSearchRepository.all(published_before: Date.today.days_ago(10).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/channel_search_repository/all", record: :new_episodes do
          expect(channels.class).to eq ChannelSearchResponse
        end
      end
    end

    context "when use published_before and after" do
      let(:channels) { ChannelSearchRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339, published_before: Date.today.days_ago(5).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/channel_search_repository/all", record: :new_episodes do
          expect(channels.class).to eq ChannelSearchResponse
        end
      end
    end

    context "when use order by viewcount" do
      let(:channels) { ChannelSearchRepository.all(order: "viewcount") }
      it "return response" do
        VCR.use_cassette "api/repository/channel_search_repository/all", record: :new_episodes do
          expect(channels.class).to eq ChannelSearchResponse
        end
      end
    end
  end
end
