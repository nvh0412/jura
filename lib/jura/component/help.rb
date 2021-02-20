# frozen_string_literal: true

module Jura
  module Component
    class Help
      def self.render
        <<~TEMPLATE

      #{Component::Board::Help.render()}

      #{Component::Issue::Help.render()}

      #{Utils.format_bold('# Miscellaneous commands:')}

      help  - Display this help message
      exit  - Escape from Jurassic park

        TEMPLATE
      end
    end
  end
end
