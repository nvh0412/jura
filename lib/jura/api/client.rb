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

      raise_on [401, 404, 500]

      def set_credentials(email, token)
        self.instance_variable_set('@default_options', {
          header: {
            "Authorization" => "Basic #{Base64.urlsafe_encode64("#{email}:#{token}")}",
            "Accept" => "application/json",
            "Content-Type" => "application/json"
          }
        })
      end
    end
  end
end
