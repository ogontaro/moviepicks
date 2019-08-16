# frozen_string_literal: true

namespace :channels do
  desc ""
  task add_channel_by_top_viewcount: :environment do
    STDOUT.sync = true

    channels = try_api_with_wait { Api::Repository::ChannelSearchRepository.all(order: "viewcount") }

    loop do
      channels.result.each do |c|
        Raven.extra_context(c: c.to_hash)
        channel_entity = try_api_with_wait { Api::Repository::ChannelRepository.find(c.to_model.channel_id).result&.first }
        next if channel_entity.blank?

        Raven.extra_context(channel: channel_entity.to_hash)
        channel = channel_entity.to_model
        channel.save
        puts "channel: name: #{channel.title}, id:#{channel.channel_id} created"
      end
      channels = try_api_with_wait { channels.next }
    end
  end

  def try_api_with_wait(&api_action)
    response = nil
    loop do
      response = api_action.call
      break
    rescue Google::Apis::ClientError => e
      throw e unless e.status_code == 403
      puts "wait 1h for Youtube API Rate Limit"
      sleep 60 * 60
    end
    response
  end
end
