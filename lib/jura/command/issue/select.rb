# frozen_string_literal: true

module Jura
  module Command
    module Issue
      class Select < Base
        def self.execute!
          prompt = TTY::Prompt.new
          issues = Api::Issue.all(board_id, "assignee = currentUser()")
          issue = prompt.select("Choose issue", filter: true, per_page: 10) do |menu|
            issues.each do |b|
              menu.choice "#{b['key']} - #{b['fields']['summary']}", b
            end
          end

          issue = Api::Issue.show(issue['key'])
          puts Component::Issue::Show.render(issue)
        end
      end
    end
  end
end
