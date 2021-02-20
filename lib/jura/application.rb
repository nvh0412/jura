# frozen_string_literal: true

module Jura
  module Application
    extend self

    def start(args)
      Readline.completion_append_character = " "

      Readline.completion_proc = lambda { |buffer|
        Command.generate_suggestions(buffer, Readline.line_buffer)
      }

      prompt = TTY::Prompt.new

      prompt.say(Jura::Component::Logo.render)
      prompt.say(Jura::Component::Help.render)

      config = Jura::Configuration.instance.load_config

      if config.empty?
        config = config_credentials(prompt)
      else
        prompt.say("Welcome back!, " + Utils.paint(config['email'], :green) + "\n\n")
        prompt.say("Your selected board is " + Utils.paint(config['selected_board_name'], :green) + "\n\n") unless config['selected_board_id'].nil?
      end

      Jura::Configuration.instance.set_config(config)

      loop do
        command_buffer = Readline.readline("\e[15;48;5;27m Jura Guarrr! \e[0m > ", true)

        Jura::Command.execute!(command_buffer.strip())
      end
    rescue Interrupt
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

      config = {}

      if Jura::Api::Token.verify?(email, token)
        prompt.say("Logged in as #{email}\n", color: :green)
        prompt.say("Configuration has been saved to " + Utils.paint(CONFIG_FILE_PATH, :green) + "\n")

        config = { 'email' => email, 'token' => Base64.urlsafe_encode64("#{email}:#{token}") }

        Jura::Configuration.instance.save_config(config)
      else
        prompt.say("Your token or email is invalid", color: :red)
      end

      config
    end
  end
end
