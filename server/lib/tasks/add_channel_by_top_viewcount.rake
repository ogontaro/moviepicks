# frozen_string_literal: true

namespace :channels do
  desc ""
  task add_channel_by_top_viewcount: :environment do
    channels = Api::Repository::ChannelSearchRepository.all(order: "viewcount")

    loop do
      channels.result.each do |c|
        channel = Api::Repository::ChannelRepository.find(c.to_hash[:channel_id]).result.first
        Raven.extra_context(channel: channel.to_hash.to_hash)
        channel.to_model.save
      end
      channels = channels.next
    end
  end
end
