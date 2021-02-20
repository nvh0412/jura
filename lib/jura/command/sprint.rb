# frozen_string_literal: true

require 'jura/command/sprint/list'
require 'jura/command/sprint/current'

module Jura
  module Command
    module Sprint
      def self.execute!(sub_cmd, args)
        case sub_cmd
        when "show"
          Command::Sprint::Current.execute!(args)
        when "list"
          Command::Sprint::List.execute!
        else
          Command::Invalid.execute("Command not found: #{command.inspect}. Run #{"help".inspect} for more informations")
        end
      end
    end
  end
end
