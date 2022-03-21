# frozen_string_literal: true

module Jura
  module Command
    module Sprint
      class DisplaySubmenu < Base
        def self.execute!(issue)
          prompt = TTY::Prompt.new
          action = prompt.select("Choose your action") do |menu|
            menu.choice name: "View", value: 1
            menu.choice name: "Estimate the story point", value: 2
            menu.choice name: "Change the status/column", value: 3
            menu.choice name: "Move it back to the backlog", value: 4
            menu.choice name: "Back", value: 5
          end

          case action
          when 1
            Jura::Control::Sprint.instance.execute_command("show_issue", issue)
          when 2
            puts Component::Issue::Estimate.render(issue)
          when 3
            puts Component::Issue::ChangeColumn.render(issue)
          when 4
          end
        end
      end
    end
  end
end
