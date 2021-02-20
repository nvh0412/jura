# frozen_string_literal: true

module Jura
  module Command
    module Sprint
      class List
        def self.execute!
          config = Jura::Configuration.instance.load_config
          board_id = config['selected_board_id']

          sprints = Api::Sprint.all(board_id)
          puts Component::Sprint.render(sprints)
        end
      end
    end
  end
end
