# frozen_string_literal: true

module Jura
  module Component
    module Sprint
      class Show
        def self.render(issues)
					table = TTY::Table.new(header: ["TO DO", "IN PROGRESS", "IN REVIEW", "DONE"])
					convertIssues(table, issues)
					table.render :unicode, resize: true, column_widths: [25, 25, 25, 25] do |renderer|
						renderer.border.separator = :each_row
					end
        end

        def self.convertIssues(table, issues)
          issues.each do |issue|
            state = issue['fields']['status']['name']
            case state.downcase
            when 'to do'
              table << [render_issue(issue), '', '', '']
            when 'in progress'
              table << ['', render_issue(issue), '', '']
            when 'in review'
              table << ['', '', render_issue(issue), '']
            when 'done'
              table << ['', '', '', render_issue(issue)]
            end
          end
        end

        def self.render_issue(issue)
          "#{issue['key']} - #{issue['fields']['summary']}"
        end
      end
    end
  end
end
