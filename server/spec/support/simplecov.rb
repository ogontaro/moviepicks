# frozen_string_literal: true

require "simplecov"
SimpleCov.minimum_coverage 90
SimpleCov.start "rails" do
  # add_group 'GraphQL', 'app/graphql'
  add_filter "/app/graphql/" # 後に解除
  add_filter "/app/controllers/" # 後に解除

  add_filter "/app/channels/"
  add_filter "/app/mailers/"
  add_filter "/app/jobs/"
  add_filter "/bin/"
  add_filter "/db/"
  add_filter "/spec/"
  add_filter "/vendor/"
end if ENV["CIRCLECI"]
