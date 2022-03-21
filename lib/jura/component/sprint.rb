# frozen_string_literal: true

require "jura/component/sprint/help"
require "jura/component/sprint/active"

module Jura
  module Component
    module Sprint
      def self.render(sprints)
        <<~TEMPLATE
          #{sprints.map { |s| render_sprint(s) }.join("\n")}
        TEMPLATE
      end

      private

      def self.render_sprint(sprint)
        "#{sprint['id']} - #{sprint['name']} - #{sprint['state']}"
      end
    end
  end
end
