# frozen_string_literal: true

module Jura
  module Command
    module Sprint
      class List < Base
        def self.execute!
          sprints = Api::Sprint.all(board_id)
          puts Component::Sprint.render(sprints)
        end
      end
    end
  end
end
