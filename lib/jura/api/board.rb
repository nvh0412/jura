# frozen_string_literal: true

module Jura
  module Api
    module Board
      extend self

      def all
        parse_body(
          Client.get('/board', {
            headers: {
              "Authorization" => "Basic #{Token.get_token}"
            }
          }).body
        )['values']
      end

      def configuration(board_id)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          }
        }

        url = "/board/#{board_id}/configuration"

        parse_body(Client.get(url, options).body)
      end

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
