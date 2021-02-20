# frozen_string_literal: true

module Jura
  module Component
    module Board
      class Help
        def self.render
          <<~TEMPLATE.strip
            #{Utils.format_bold("# Available board commands:")}
            board list                - Show list of boards
            board select              - Select board
          TEMPLATE
        end
      end
    end
  end
end
