module Jura
  module Application
    extend self

    def start(args)
      prompt = TTY::Prompt.new

      print_help!(prompt)
    end

    def print_help!(prompt)
      prompt.say(Jura::View::Help.render)
    end
  end
end
