# frozen_string_literal: true

require 'byebug'

module Jura
  module Application
    extend self

    CONFIG_FILE_PATH = "~/.jura.config.json"

    def start(args)
      Readline.completion_append_character = " "

      Readline.completion_proc = lambda { |buffer|
        Command.generate_suggestions(buffer, Readline.line_buffer)
      }

      prompt = TTY::Prompt.new

      prompt.say(Jura::Component::Logo.render)

      config_credentials(prompt)

      loop do
        command_buffer = Readline.readline("\e[15;48;5;27m Jura Guarrr! \e[0m > ", true)

        Jura::Command.execute!(command_buffer.strip())
      end
    rescue Interrupt
      Command::Exit.execute
    end

    def config_credentials(prompt)
      email = prompt.ask("Jira account email: ") { |q| q.validate :email }
      token = prompt.ask("Jira token (Visit https://id.atlassian.com/manage-profile/security/api-tokens): ") do|q|
        q.required true
      end

      Jura::Api::Client.instance.set_credentials(email, token)

      if Jura::Api::Token.verify!
      else
      end
    rescue HTTParty::ResponseError => e
      debugger
    end
  end
end
