# frozen_string_literal: true

module Jura
  module Command
    module Issue
      class List
        def self.execute!(sub_cmd, args)
          config = Jura::Configuration.instance.load_config
          board_id = config['selected_board_id']

          if args.size == 0
            issues = Api::Issue.all(board_id)
            puts Component::Issue.render(issues)
          else
            arg = args[0]
            if arg == 'mine'
              issues = Api::Issue.all(board_id, "assignee = currentUser()")
              puts Component::Issue.render(issues)
            end
          end
        end
      end
    end
  end
end
