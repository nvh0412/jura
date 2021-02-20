# frozen_string_literal: true

module Jura
  module Command
    module Issue
      class List
        def self.execute!
          config = Jura::Configuration.instance.load_config
          board_id = config['selected_board_id']

          issues = Api::Issue.all(board_id)
          puts Component::Issue.render(issues)
        end
      end
    end
  end
end