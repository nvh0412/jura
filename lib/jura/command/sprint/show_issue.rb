# frozen_string_literal: true

require 'byebug'

module Jura
  module Command
    module Sprint
      class ShowIssue < Base
        def self.execute!(issue)
          puts Component::Issue::Show.render(issue)
        end
      end
    end
  end
end
