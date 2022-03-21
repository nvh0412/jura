# frozen_string_literal: true

module Jura
  module Command
    class Exit
      def self.execute!(_sub_cmd, _args)
        puts "Guar :("
        exit
      end
    end
  end
end
