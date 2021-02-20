# frozen_string_literal: true

require "jura/component/board/help"

module Jura
  module Component
    module Board
      def self.render(boards)
        <<~TEMPLATE
          #{boards.map { |board| render_board(board) }.join("\n")}
        TEMPLATE
      end

      private

      def self.render_board(board)
        "#{board['id']} - #{board['key']}"
      end
    end
  end
end
