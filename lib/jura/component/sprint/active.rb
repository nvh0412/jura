# frozen_string_literal: true

module Jura
  module Component
    module Sprint
      class Active
        def self.render(board_id, sprint, config)
          prompt = TTY::Prompt.new
          columns = config.dig('columnConfig', 'columns')
          column = prompt.select("Choose the column", filter: true, per_page: 5) do |menu|
            columns.each do |c|
              menu.choice c['name'], c
            end
          end

          issues = Spinner.render do
            Api::Sprint.show(board_id, sprint['id'])
          end

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
            menu.choice name: "Estimate the story point", value: 2
            menu.choice name: "Change the status/column", value: 3
            menu.choice name: "Move it back to the backlog", value: 4
            menu.choice name: "Cancel", value: 5
          end

          case action
          when 1
            puts Component::Issue::Show.render(issue)
            display_submenu(prompt, issue)
          when 2
            puts Component::Issue::Estimate.render(issue)
            display_submenu(prompt, issue)
          when 3
            puts Component::Issue::ChangeColumn.render(issue)
            display_submenu(prompt, issue)
          when 4
          else
            puts "Do nothing!"
          end
        end
      end
    end
  end
end
