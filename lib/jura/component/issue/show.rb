# frozen_string_literal: true

module Jura
  module Component
    module Issue
      class Show
        def self.render(issue)
          issue_id = issue['key']
          key = Issue.convert_key(issue)
          url = URI.parse(issue['self']).host
          project = issue['fields']['project']['name']
          box = TTY::Box.frame(
            border: :thick,
            padding: [1,2],
            title: {top_left: issue_id, bottom_right: project},
            width: TTY::Screen.width
          ) do
            <<~TEMPLATE
            #{Jura::Utils.format_bold(issue['fields']['summary'])}

            #{Jura::Utils.format_bold('URL')}: #{TTY::Link.link_to("Issue Link", "https://#{url}/browse/#{key}")}

            #{Jura::Utils.format_bold('Description')}

            #{TTY::Markdown.parse(issue['fields']['description'])}
            TEMPLATE
          end
        end
      end
    end
  end
end
