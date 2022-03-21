# frozen_string_literal: true

module Jura
  module Component
    module Issue
      class ChangeColumn
        def self.render(issue)
          prompt = TTY::Prompt.new

          transitions = Api::Transitions.all(issue['id'])

          status = prompt.select("Choose the status") do |menu|
            transitions.each do |t|
              menu.choice t['name'], t
            end

            menu.choice 'Cancel', 'cancel'
          end

          if status == 'cancel'
            Sprint::Active.display_submenu(prompt, issue)
            return
          end

          unless prompt.yes?("Do you want to change the status of this issue to '#{status['name']}'?")
            render(issue)
          end

          Spinner.render(
            "Changed status of this issue from #{issue['fields']['status']['name']} to #{status['name']}!", clear: false
          ) do
            Api::Transitions.transition(issue['id'], { transition: { id: status['id'] } })
          end

          puts ""
        end
      end
    end
  end
end
