# frozen_string_literal: true

module Jura
  module Command
    class Board
      def self.execute!(sub_cmd, args)
        boards = Api::Board.all

        puts Component::Board.render(boards)
      end
    end
  end
end
