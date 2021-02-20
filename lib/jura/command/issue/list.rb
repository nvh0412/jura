# frozen_string_literal: true

module Jura
  module Command
    module Issue
      class List < Base
        def self.execute!
          issues = Api::Issue.all(board_id)
          puts Component::Issue.render(issues)
        end
      end
    end
  end
end
