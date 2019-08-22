# frozen_string_literal: true

module Api
  module Response
    module YoutubeScraping
      class ChannelFindResponse < BaseResponse
        def initialize(**params)
          super(params)
        end

        def result
          response = nil
          begin
            response = Api::Entity::YoutubeScraping::ChannelEntity.new channel_json
          rescue Api::Client::YoutubeScrapingClientError => e
            return nil
          end
          response
        end

        def result!
          Api::Entity::YoutubeScraping::ChannelEntity.new channel_json
        end

        def channel_json
          response_about = ChannelFindResponse.client.channel_about(params[:channel_id])
          channel_about_doc = Oga.parse_html(response_about.body.force_encoding "UTF-8")
          result = {
            channel_id: params[:channel_id],
            title: channel_about_doc.xpath("/html/head/meta[@name='title']/@content")&.first&.text,
            description: channel_about_doc.xpath("//*[@id='browse-items-primary']/li/div/div[4]/pre/text()")&.first&.text,
            country: channel_about_doc.xpath("//*[@id='browse-items-primary']/li/div/div[6]/span[2]")&.first&.text&.squish,
            published_at: channel_about_doc.xpath("//*[@id='browse-items-primary']/li/div/div[1]/div/span[3]")&.text&.gsub(/[^[\d|\/]]/, ""),
            subscriber_count: channel_about_doc.xpath("//*[@id='browse-items-primary']/li/div/div[1]/div/span[1]/b")&.text&.gsub(/(\d{0,3}),(\d{3})/, '\1\2')&.to_i,
            view_count: channel_about_doc.xpath("//*[@id='browse-items-primary']/li/div/div[1]/div/span[2]/b")&.text&.gsub(/(\d{0,3}),(\d{3})/, '\1\2')&.to_i
          }

          response_search = ChannelFindResponse.client.search(result[:title])
          channel_search_doc = Oga.parse_html(response_search.body.force_encoding "UTF-8")
          result.merge!(
            video_count: channel_search_doc.xpath("//*[@class='item-section']/li[1]/div/div[2]/div[1]/ul/li")&.first&.text&.gsub(/[^\d]/, "")
          )
        end
      end
    end
  end
end
