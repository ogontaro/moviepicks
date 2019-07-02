# frozen_string_literal: true

require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.filter_sensitive_data("<GOOGLE_API_KEY>") { ENV["GOOGLE_API_KEY"] }
end
