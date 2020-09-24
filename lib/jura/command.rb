# frozen_string_literal: true
require 'jura/command/board'
require 'jura/command/help'
require 'jura/command/exit'
require 'jura/command/invalid'

module Jura
  module Command
    COMMANDS = {
      "board" => -> (sub_cmd, args) { Command::Board.execute!(sub_cmd, args) },
      "help" => -> (sub_cmd, args) { Command::Help.execute() },
      "exit" => -> (sub_cmd, args) { Command::Exit.execute() }
    }

    def self.execute!(cmd_buffer)
      cmd_name, sub_cmd, *args = cmd_buffer.to_s.strip.split(" ")

      if cmd_name.nil? || cmd_name.empty?
        # TODO: return and execute empty command error
      end

      command = COMMANDS[cmd_name]

      if command.nil?
        return Command::Invalid.execute("Command not found: #{command.inspect}. Run #{"help".inspect} for more informations")
      end

      command.call(sub_cmd, args)
    end

    def generate_suggestions(buffer, command_buffer)
      commands = {
        "board" => %[add list select]
      }

      commands.keys.grep(/^#{Regexp.escape(buffer)}/)
    end
  end
end
