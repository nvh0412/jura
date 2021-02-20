# frozen_string_literal: true

require 'jura/command/board/select'

module Jura
  module Command
    module Board
      class RequiredBoardIdError < StandardError; end

      def self.execute!(sub_cmd, args)
        case sub_cmd
        when "list"
          boards = Api::Board.all
          puts Component::Board.render(boards)
        when "select"
          Command::Board::Select.execute
        else
          Command::Invalid.execute("Command not found: #{sub_cmd.inspect}. Run #{"help".inspect} for more informations")
        end
      end
    end
  end
end
