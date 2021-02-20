# frozen_string_literal: true

module Jura
  module Command
    module Sprint
      class Current
        def self.execute!(args)
          if args.length != 1
            return
          end

          sprint_id = args[0]

          config = Jura::Configuration.instance.load_config
          board_id = config['selected_board_id']

          issues = Api::Sprint.show(board_id, sprint_id)
          puts Component::Sprint::Show.render(issues)
        end
      end
    end
  end
end
