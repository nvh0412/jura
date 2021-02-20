# frozen_string_literal: true

require "jura/component/issue/help"

module Jura
  module Component
    module Issue
      def self.render(issues)
        <<~TEMPLATE
          #{issues.map { |i| render_issue(i) }.join("\n")}
        TEMPLATE
      end

      private

      def self.render_issue(issue)
        "#{issue['id']} - #{issue['key']} - #{issue['fields']['summary']} - #{issue['fields']['status']['name']}"
      end
    end
  end
end
