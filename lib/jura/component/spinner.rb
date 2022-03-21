# frozen_string_literal: true

module Jura
  module Component
    class Spinner
      def self.render
        spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2, clear: true)
        spinner.auto_spin
        res = yield
        spinner.stop
        res
      end
    end
  end
end
