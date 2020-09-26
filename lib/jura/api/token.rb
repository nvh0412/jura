# frozen_string_literal: true

module Jura
  module Api
    module Token
      extend self

      def verify!
        values = parse_body(
          Client.get('/board?total=1').body
        )['values']

        !values.nil?
      end

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
