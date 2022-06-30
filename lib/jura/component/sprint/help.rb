# frozen_string_literal: true

module Jura
  module Component
    module Sprint
      class Help
        def self.render
          <<~TEMPLATE.strip
            #{Utils.format_bold("# Available sprint commands:")}
            sprint active              - Show the active sprint
            sprint list                - Show list of sprints
            sprint show <sprint_id>    - Show list of issues of 1 sprint
          TEMPLATE
        end
      end
    end
  end
end
