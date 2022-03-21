# frozen_string_literal: true

require 'jura/command/sprint/base'
require 'jura/command/sprint/list'
require 'jura/command/sprint/active'
require 'jura/command/sprint/display_submenu'
require 'jura/command/sprint/show_issue'

module Jura
  module Command
    module Sprint
      def self.execute!(sub_cmd, args)
        unless Jura::Control::Sprint.instance.support_command?(sub_cmd)
          return Command::Invalid.execute("Command not found: #{sub_cmd}. Run #{"help".inspect} for more informations")
        end

        Jura::Control::Sprint.instance.execute_command(sub_cmd)
        Jura::Control::Sprint.instance.undo_command
      end
    end
  end
end
