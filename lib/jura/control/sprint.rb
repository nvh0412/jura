# frozen_string_literal: true

require 'byebug'

module Jura
  module Control
    class Sprint < Jura::RootControl
      def execute_command(name, opts = nil)
        commands[name].execute!(opts)
        executed_commands << [commands[name], opts]
      end

      def undo_command
        return if executed_commands.length < 2

        executed_commands.pop
        command, opts = executed_commands.pop
        command.execute!(opts)
        executed_commands << [command, opts]
      end

      def config_commands
        set_command("list", Command::Sprint::List)
        set_command("active", Command::Sprint::Active)
        set_command("display_submenu", Command::Sprint::DisplaySubmenu)
        set_command("show_issue", Command::Sprint::ShowIssue)
      end

      def executed_commands
        @executed_commands ||= []
      end
    end
  end
end
