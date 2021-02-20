# frozen_string_literal: true

module Jura
  module Command
    module Sprint
      class Show < Base
        def self.execute!(args)
          if args.length != 1
            return
          end

          sprint_id = args[0]

          issues = Api::Sprint.show(board_id, sprint_id)
          puts Component::Sprint::Show.render(issues)
        rescue HTTParty::ResponseError => _e
          Command::Invalid.execute("Something went wrong, please try with another command")
        end
      end
    end
  end
end
