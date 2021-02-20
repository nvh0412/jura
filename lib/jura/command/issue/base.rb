# frozen_string_literal: true

module Jura
  module Command
    module Issue
      class Base
        def self.board_id
          config = Jura::Configuration.instance.load_config
          board_id = config['selected_board_id']

          raise Command::Board::RequiredBoardIdError if board_id.nil?

          board_id
        end
      end
    end
  end
end
