# frozen_string_literal: true

require 'jura/command/issue/list'

module Jura
  module Command
    module Issue
      def self.execute!(sub_cmd, args)
        case sub_cmd
        when "list"
          Command::Issue::List.execute!(sub_cmd, args)
        else
          Command::Invalid.execute("Command not found: #{command.inspect}. Run #{"help".inspect} for more informations")
        end
      end
    end
  end
end
