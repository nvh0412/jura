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

      def search(keyword)
        parse_body(
          Client.get("/board?name=#{keyword}", {
            headers: {
              "Authorization" => "Basic #{Token.get_token}"
            }
          }).body
        )['values']
      end

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
