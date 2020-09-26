# frozen_string_literal: true

module Jura
  module Component
    class Board
      def self.render(boards)
        <<~TEMPLATE
          #{boards.map { |board| render_board(board) }.join("\n")}
        TEMPLATE
      end

      private

      def self.render_board(board)
        "#{board['id']} - #{board['location']['displayName']}"
      end
    end
  end
end
