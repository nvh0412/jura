# frozen_string_literal: true

module Jura
  module Component
    class Spinner
      def self.render(success_message = 'Loading', clear: true)
        spinner = TTY::Spinner.new("[:spinner] #{success_message}", format: :pulse_2, clear: clear)
        spinner.auto_spin
        res = yield
        success_message ? spinner.success(success_message) : spinner.stop
        res
      end
    end
  end
end
