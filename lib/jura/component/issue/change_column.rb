# frozen_string_literal: true

module Jura
  module Component
    module Issue
      class ChangeColumn
        def self.render(issue, columns)
          prompt = TTY::Prompt.new

          status = prompt.select("Choose the status") do |menu|
            columns.each do |c|
              menu.choice c['name'], c
            end
          end
        end
      end
    end
  end
end
