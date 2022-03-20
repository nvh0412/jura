# frozen_string_literal: true

module Jura
  module Component
    module Sprint
      class Active
        def self.render(board_id, sprint, config)
          prompt = TTY::Prompt.new
          column = prompt.select("Choose the column", filter: true, per_page: 5) do |menu|
            config.dig('columnConfig', 'columns').each do |c|
              menu.choice c['name'], c
            end
          end

          issues = Api::Sprint.show(board_id, sprint['id'])

          selected_issues = issues.select do |i|
            status = i.dig('fields','status', 'name')

            column['name'].downcase == status.downcase
          end

          issue = prompt.select("Choose the issue", filter: true, per_page: 10) do |menu|
            selected_issues.each do |i|
              menu.choice Component::Issue.render_line(i), i
            end
          end

          display_submenu(prompt, issue)
        end

        def self.display_submenu(prompt, issue)
          action = prompt.select("Choose your action") do |menu|
            menu.choice name: "View", value: 1
            menu.choice name: "Change the status", value: 2
            menu.choice name: "Move it back to the backlog", value: 3
            menu.choice name: "Cancel", value: 4
          end

          case action
          when 1
            puts Component::Issue::Show.render(issue)
            display_submenu(prompt, issue)
          when 2
          when 3
          else
            puts "Do nothing!"
          end
        end
      end
    end
  end
end
