# frozen_string_literal: true

require 'jura/command/issue/list'
require 'jura/command/issue/mine'

module Jura
  module Command
    module Issue
      def self.execute!(sub_cmd, args)
        case sub_cmd
        when "mine"
          Command::Issue::Mine.execute!
        when "list"
          Command::Issue::List.execute!
        else
          Command::Invalid.execute("Command not found: #{command.inspect}. Run #{"help".inspect} for more informations")
        end
      end
    end
  end
end