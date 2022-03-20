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

          puts Component::Issue.render(selected_issues)
        end
      end
    end
  end
end
