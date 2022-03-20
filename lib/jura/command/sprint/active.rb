# frozen_string_literal: true

require 'byebug'

module Jura
  module Command
    module Sprint
      class Active < Base
        def self.execute!
          sprints = Api::Sprint.all(board_id)

          configuration = Api::Board.configuration(board_id)

          active_sprint = sprints.detect { |sprint| sprint['state'] == 'active' }
          puts Component::Sprint::Active.render(board_id, active_sprint, configuration)
        end
      end
    end
  end
end
