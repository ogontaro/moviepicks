# frozen_string_literal: true

namespace :channels do
  desc ""
  task add_channel_by_top_viewcount: :environment do
    channels = Api::Repository::ChannelSearchRepository.all(order: "viewcount")

    loop do
      channels.result.each do |channel_entity|
        channel = channel_entity.to_model
        Api::Repository::ChannelRepository.find(channel.channel_id).result.first.to_model.save
      end
      channels.next
    end
  end
end
