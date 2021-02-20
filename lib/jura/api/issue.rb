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

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
