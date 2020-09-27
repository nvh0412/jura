# frozen_string_literal: true
require 'base64'
require 'singleton'
require 'httparty'

module Jura
  module Api
    class Client
      include Singleton
      include HTTParty

      base_uri 'https://employmenthero.atlassian.net/rest/agile/1.0'

      headers ({
        "Accept" => "application/json",
        "Content-Type" => "application/json",
      })

      raise_on [401, 404, 500]
    end
  end
end
