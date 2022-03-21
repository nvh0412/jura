# frozen_string_literal: true
require 'jura/command/board'
require 'jura/command/issue'
require 'jura/command/sprint'
require 'jura/command/help'
require 'jura/command/exit'
require 'jura/command/invalid'

module Jura
  module CommandHandler
    def self.call(cmd_buffer)
      cmd_name, sub_cmd, *args = cmd_buffer.to_s.strip.split(" ")

      if cmd_name.nil? || cmd_name.empty?
        # TODO: return and execute empty command error
      end

      unless Jura::RootControl.instance.support_command?(cmd_name)
        return Command::Invalid.execute("Command not found: #{cmd_name}. Run #{"help".inspect} for more informations")
      end

      puts '' # Empty line
      Jura::RootControl.instance.execute_command(cmd_name, sub_cmd: sub_cmd, args: args)
      puts '' # Empty line
    rescue Command::Board::RequiredBoardIdError => _
      puts 'Please select a board first!'
      Jura::RootControl.execute_command('select')
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
