# frozen_string_literal: true

module Jura
  module Command
    class Invalid
      def self.execute(message)
        puts message
      end
    end
  end
end
