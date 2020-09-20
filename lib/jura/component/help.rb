# frozen_string_literal: true
#
module Jura
  module Component
    class Help
      def self.render
        <<~TEMPLATE.strip
          #{Utils.format_bold(Utils.paint("Jura v#{Jura::VERSION} - Interactive CLI application for Jira", :blue))}


          #{Utils.format_bold('# Miscellaneous commands:')}

          help  - Display this help message


        TEMPLATE
      end
    end
  end
end
