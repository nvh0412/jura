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

        url = "https://employmenthero.atlassian.net/rest/api/3/issue/#{issue_id}"

        parse_body(HTTParty.get(url, options).body)
      end

      def get_estimation(issue_id, board_id)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          }
        }

        url = "/issue/#{issue_id}/estimation?boardId=#{board_id}"

        parse_body(
          Client.get(url, options).body
        )
      end

      def estimate(issue_id, point)
        options = {
          headers: {
            "Authorization" => "Basic #{Token.get_token}"
          },
          body: {
            value: point
          }.to_json
        }

        board_id = Jura::Configuration.instance.load_config['selected_board_id']

        url = "/issue/#{issue_id}/estimation?boardId=#{board_id}"

        parse_body(
          Client.put(url, options).body
        )
      end

      private

      def parse_body(body)
        JSON.parse(body)
      end
    end
  end
end
