# frozen_string_literal: true

module Jura
  module Component
    module Issue
      class Estimate
        def self.render(issue)
          prompt = TTY::Prompt.new
          point_value = prompt.ask("How many points do you want to estimate?", default: 1)

          Spinner.render("Estimated this issue - #{point_value} points!", clear: false) do
            Api::Issue.estimate(issue['id'], point_value)
          end

          puts ""
        end
      end
    end
  end
end
