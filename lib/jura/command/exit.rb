# frozen_string_literal: true

module Jura
  module Command
    class Exit
      def self.execute
        puts "Guar :("
        exit
      end
    end
  end
end
