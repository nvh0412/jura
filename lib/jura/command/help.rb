# frozen_string_literal: true

module Jura
  module Command
    class Help
      def self.execute
        puts Component::Help.render
      end
    end
  end
end
