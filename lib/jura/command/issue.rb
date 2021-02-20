# frozen_string_literal: true

require 'jura/command/issue/base'
require 'jura/command/issue/list'
require 'jura/command/issue/show'
require 'jura/command/issue/mine'
require 'jura/command/issue/select'

module Jura
  module Command
    module Issue
      def self.execute!(sub_cmd, args)
        case sub_cmd
        when "mine"
          Command::Issue::Mine.execute!
        when "select"
          Command::Issue::Select.execute!
        when "list"
          Command::Issue::List.execute!
        when "show"
          Command::Issue::Show.execute!(args)
        else
          Command::Invalid.execute("Command not found: #{sub_cmd.inspect}. Run #{"help".inspect} for more informations")
        end
      end
    end
  end
end
