# frozen_string_literal: true

module Jura
  module Command
    module Issue
      class Show < Base
        def self.execute!(args)
          if (args.length != 1)
            return
          end

          issue = Api::Issue.show(args[0])
          puts Component::Issue::Show.render(issue)
        end
      end
    end
  end
end
