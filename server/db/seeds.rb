# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Api::Repository::GuideCategoryRepository.all.result.map(&:to_model).each(&:save)
Api::Repository::ChannelSearchRepository.all(order: "viewcount").result.map(&:to_model).each(&:save)
Channel.all.each { |channel| Api::Repository::ChannelRepository.find(channel.channel_id).result.first.to_model.save }
