# frozen_string_literal: true

module Jura
  module Api
    module Issue
      extend self

      def all(board_id, query = nil)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          }
        }

        url = "/board/#{board_id}/issue?"
        url = "#{url}jql=#{query}" unless query.nil?

        parse_body(
          Client.get(url, options).body
        )['issues']
      end

      def show(issue_id)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          }
        }

        url = "https://employmenthero.atlassian.net/rest/api/2/issue/#{issue_id}"

        parse_body(HTTParty.get(url, options).body)
      end

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
