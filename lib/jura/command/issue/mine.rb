# frozen_string_literal: true

module Jura
  module Command
    module Issue
      class Mine < Base
        def self.execute!
          issues = Api::Issue.all(board_id, "assignee = currentUser()")
          puts Component::Issue.render(issues)
        end
      end
    end
  end
end
