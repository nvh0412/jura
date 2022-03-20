# frozen_string_literal: true

require 'json'

module Jura
  module Api
    module Transitions
      extend self

      def all(issue_id)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          }
        }

        url = "https://employmenthero.atlassian.net/rest/api/3/issue/#{issue_id}/transitions"

        parse_body(HTTParty.get(url, options).body)['transitions']
      end

      def transition(issue_id, body)
        options = {
          headers: {
            'Authorization': "Basic #{Token.get_token}",
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: body.to_json
        }

        url = "https://employmenthero.atlassian.net/rest/api/3/issue/#{issue_id}/transitions"

        HTTParty.post(url, options)
      end

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
