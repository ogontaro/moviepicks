# frozen_string_literal: true

namespace :channels do
  desc ""
  task add_channel_by_top_viewcount: :environment do
    channels = Api::Repository::ChannelSearchRepository.all(order: "viewcount")

    loop do
      channels.result.each do |c|
        Raven.extra_context(c: c.to_hash)
        channel = Api::Repository::ChannelRepository.find(c.to_model.channel_id).result&.first

        if channel.present?
          Raven.extra_context(channel: channel.to_hash)
          channel.to_model.save
        end
      end

      begin
        channels = channels.next
      rescue Google::Apis::ClientError => e
        throw e unless e.status_code == 403
        sleep 60 * 60 # 1hまつ
        next
      end
    end
  end
end
