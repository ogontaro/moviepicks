# frozen_string_literal: true

namespace :channels do
  desc ""
  task add_channel_by_top_viewcount: :environment do
    channels = Api::Repository::ChannelSearchRepository.all(order: "viewcount")

    loop do
      channels.result.each do |c|
        Raven.extra_context(c: c.to_hash)
        channel_entity = Api::Repository::ChannelRepository.find(c.to_model.channel_id).result&.first
        if channel_entity.present?
          Raven.extra_context(channel: channel_entity.to_hash)
          channel = channel_entity.to_model
          channel.save
          puts "channel: name: #{channel.name}, id:#{channel.channel_id} created"
        end
      end

      begin
        channels = channels.next
      rescue Google::Apis::ClientError => e
        throw e unless e.status_code == 403
        puts "sleep 1h"
        sleep 60 * 60 # 1hまつ
        next
      end
    end
  end
end
