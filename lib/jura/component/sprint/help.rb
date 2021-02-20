# frozen_string_literal: true

module Jura
  module Component
    module Sprint
      class Help
        def self.render
          <<~TEMPLATE.strip
            #{Utils.format_bold("# Available sprint commands:")}
            sprint list                - Show list of sprints
            sprint show                - Show list of issues of 1 sprint
          TEMPLATE
        end
      end
    end
  end
end
