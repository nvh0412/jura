# frozen_string_literal: true

module Jura
  module Component
    module Issue
      class Help
        def self.render
          <<~TEMPLATE.strip
            #{Utils.format_bold("# Available issue commands:")}
            issue list                - Show list of issues in backlog
            issue mine                - Show list of issues which have assingee is mine
            issue show <issue_id>     - Show details of an issue
          TEMPLATE
        end
      end
    end
  end
end
