# frozen_string_literal: true

module Jura
  module Command
    class Board
      def self.execute!(sub_cmd, args)
        p sub_cmd
        p args
      end
    end
  end
end