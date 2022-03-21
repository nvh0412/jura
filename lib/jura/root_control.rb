# frozen_string_literal: true
require 'singleton'

module Jura
  class RootControl
    include Singleton

    def set_command(key, command)
      commands[key] = command
    end

    def undo_command
      return if executed_commands.length.zero?

      command, opts = executed_commands.pop
      command.execute!(opts[:sub_cmd], opts[:args])
    end

    def support_command?(name)
      commands.keys.include?(name)
    end

    def execute_command(name, opts = {})
      commands[name].execute!(opts[:sub_cmd], opts[:args])
      executed_commands << [commands[name], opts]
    end

    def commands
      @commands ||= {}
    end

    def config_commands
      set_command("board", Command::Board)
      set_command("issue", Command::Issue)
      set_command("sprint", Command::Sprint)
      set_command("help", Command::Help)
      set_command("exit", Command::Exit)
    end

    def executed_commands
      @executed_commands ||= []
    end
  end
end
