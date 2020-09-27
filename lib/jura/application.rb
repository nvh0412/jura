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
    rescue HTTParty::ResponseError => e
      Command::Exit.execute
    end

    def config_credentials(prompt)
      email = prompt.ask("Jira account email: ") { |q| q.validate :email }

      has_token = prompt.yes?("Already have your JIRA token?")

      unless has_token
        prompt.say("\nOpening Your default browser")
        prompt.warn("> Warning: If browser does not open, visit")
        prompt.warn("> https://id.atlassian.com/manage-profile/security/api-tokens to obtain your token\n")

        system "open https://id.atlassian.com/manage-profile/security/api-tokens"
      end

      token = prompt.mask("Input your Jira token: ") do|q|
        q.required true
      end

      if Jura::Api::Token.verify?(email, token)
        prompt.say("Logged in as #{email}", color: :green)
        p ''
      else
        prompt.say("Your token or email is invalid", color: :red)
      end
    end
  end
end
