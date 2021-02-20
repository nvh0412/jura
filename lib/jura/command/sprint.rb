# frozen_string_literal: true

require 'jura/command/sprint/base'
require 'jura/command/sprint/list'
require 'jura/command/sprint/show'

module Jura
  module Command
    module Sprint
      def self.execute!(sub_cmd, args)
        case sub_cmd
        when "show"
          Command::Sprint::Show.execute!(args)
        when "list"
          Command::Sprint::List.execute!
        else
          Command::Invalid.execute("Command not found: #{command.inspect}. Run #{"help".inspect} for more informations")
        end
      end
    end
  end
end
