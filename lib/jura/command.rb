# frozen_string_literal: true
require 'jura/command/board'
require 'jura/command/issue'
require 'jura/command/sprint'
require 'jura/command/help'
require 'jura/command/exit'
require 'jura/command/invalid'

module Jura
  module Command
    COMMANDS = {
      "board" => -> (sub_cmd, args) { Command::Board.execute!(sub_cmd, args) },
      "issue" => -> (sub_cmd, args) { Command::Issue.execute!(sub_cmd, args) },
      "sprint" => -> (sub_cmd, args) { Command::Sprint.execute!(sub_cmd, args) },
      "help" => -> (*_args) { Command::Help.execute() },
      "exit" => -> (*_args) { Command::Exit.execute() }
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

      puts '' # Empty line
      command.call(sub_cmd, args)
      puts '' # Empty line
    rescue Command::Board::RequiredBoardIdError => _
      puts 'Please select a board first!'
      Command::Board.execute!('select', [])
    end

    def generate_suggestions(buffer, command_buffer)
      commands = {
        "board" => %[list select],
        "issue" => %[list],
        "sprint" => %[list show]
      }

      commands.keys.grep(/^#{Regexp.escape(buffer)}/)
    end
  end
end
