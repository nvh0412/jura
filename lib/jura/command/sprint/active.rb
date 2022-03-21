# frozen_string_literal: true

module Jura
  module Command
    module Sprint
      class Active < Base
        def self.execute!(opts = nil)
          sprints = Component::Spinner.render do
            Api::Sprint.all(board_id)
          end

          configuration = Component::Spinner.render do
            Api::Board.configuration(board_id)
          end

          active_sprint = sprints.detect { |sprint| sprint['state'] == 'active' }
          puts Component::Sprint::Active.render(board_id, active_sprint, configuration)
        end
      end
    end
  end
end
