# frozen_string_literal: true

require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  uri_without_params = VCR.request_matchers.uri_without_param(:publishedAfter, :publishedBefore)
  c.default_cassette_options = { match_requests_on: [:method, uri_without_params] }
  c.filter_sensitive_data("<GOOGLE_API_KEY>") { ENV["GOOGLE_API_KEY"] }
end
