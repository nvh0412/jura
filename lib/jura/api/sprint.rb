# frozen_string_literal: true

module Jura
  module Api
    module Sprint
      extend self

      def all(board_id, state = nil)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          }
        }

        url = "/board/#{board_id}/sprint?"
        url = "#{url}state=#{state}" unless state.nil?

        parse_body(
          Client.get(url, options).body
        )['values']
      end

      def show(board_id, sprint_id)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          }
        }

        url = "/board/#{board_id}/sprint/#{sprint_id}/issue"

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
