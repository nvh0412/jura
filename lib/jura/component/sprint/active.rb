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

          Control::Sprint.instance.execute_command("display_submenu", issue)
          puts ""
        end
      end
    end
  end
end
