# frozen_string_literal: true

module Jura
  module Application
    extend self

    def start(args)
      prompt = TTY::Prompt.new

      prompt.say(Jura::Component::Help.render)

      loop do
        command_buffer = Readline.readline("\e[15;48;5;27m Jura Guarrr! \e[0m > ", true)

        Jura::Command.execute!(command_buffer.strip())
      end
    end
  end
end
