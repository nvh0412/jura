# frozen_string_literal: true

module Jura
  module Api
    module Token
      extend self

      def verify?(email, token)
        values = parse_body(
          Client.get('/board?total=1', {
            headers: {
              "Authorization" => "Basic #{Base64.urlsafe_encode64("#{email}:#{token}")}"
            }
          }).body
        )['values']

        !values.nil?
      rescue HTTParty::ResponseError => e
        false
      end

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
