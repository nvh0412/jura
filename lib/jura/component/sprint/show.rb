# frozen_string_literal: true

require 'byebug'

module Jura
  module Component
    module Sprint
      class Show
        def self.render(issues)
					table = TTY::Table.new(
            header: [
              "TO DO",
              Jura::Utils.paint("IN PROGRESS", :blue),
              Jura::Utils.paint("IN REVIEW", :purple),
              Jura::Utils.paint("DONE", :green)
            ]
          )
					convertIssues(table, issues)
					table.render :unicode, multiline: true, resize: true, column_widths: [25, 25, 25, 25], padding: [0,1,0,1] do |renderer|
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
          "#{issue['key']} - #{issue['fields']['summary']}\n#{Jura::Utils.paint(issue.dig('fields','assignee','displayName'), :green)}"
        end
      end
    end
  end
end
