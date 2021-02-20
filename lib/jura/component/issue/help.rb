# frozen_string_literal: true

module Jura
  module Component
    module Issue
      class Help
        def self.render
          <<~TEMPLATE.strip
            #{Utils.format_bold("# Available issue commands:")}
            issue list                - Show list of issues in backlog
          TEMPLATE
        end
      end
    end
  end
end
