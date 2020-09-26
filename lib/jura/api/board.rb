# frozen_string_literal: true

module Jura
  module Api
    module Board
      extend self

      def all
        parse_body(
          Client.get('/board').body
        )['values']
      end

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
