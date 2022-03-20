# frozen_string_literal: true

require "jura/component/issue/help"
require "jura/component/issue/show"
require "jura/component/issue/change_column"

module Jura
  module Component
    module Issue
      def self.render(issues)
        <<~TEMPLATE
          #{issues.map { |i| render_issue(i) }.join("\n")}
        TEMPLATE
      end

      def self.render_line(issue)
        render_issue(issue)
      end

      private

      def self.render_issue(issue)
        "#{convert_key(issue)} - #{paint(issue)} - #{issue['fields']['summary']}"
      end

      def self.paint(issue)
        status = issue.dig('fields','status', 'name')
        p = Pastel.new

        case status.downcase
        when 'in progress'
          p.decorate(status,:blue)
        when 'in review'
          p.decorate(status,:magenta)
        when 'done'
          p.decorate(status,:green)
        else
          p.decorate(status,:white)
        end
      end

      def self.convert_key(issue)
        kws = issue['key'].split('-')
        "#{kws[0]}-#{(kws[1].rjust(3, ' '))}"
      end
    end
  end
end
