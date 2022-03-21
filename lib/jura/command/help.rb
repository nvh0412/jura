# frozen_string_literal: true

module Jura
  module Command
    class Help
      def self.execute!(_sub_cmd, _args)
        puts Component::Help.render
      end
    end
  end
end
