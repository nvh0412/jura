# frozen_string_literal: true

module Jura
  module Component
    module Issue
      class Show
        def self.render(issue)
          board_id = Jura::Configuration.instance.load_config['selected_board_id']
          estimation = Api::Issue.get_estimation(issue['id'], board_id)

          issue_id = issue['key']
          key = Issue.convert_key(issue)
          url = URI.parse(issue['self']).host
          project = issue['fields']['project']['name']
          description = issue['fields']['description'] || ""
          box = TTY::Box.frame(
            border: :thick,
            padding: [1,2],
            title: {top_left: issue_id, bottom_right: project},
            width: TTY::Screen.width
          ) do
            <<~TEMPLATE
            #{Jura::Utils.format_bold(issue['fields']['summary'])}

            #{Jura::Utils.format_bold('URL')}: #{TTY::Link.link_to("Issue Link", "https://#{url}/browse/#{key}")}

            #{Jura::Utils.format_bold('Story points:')} #{Jura::Utils.paint(estimation["value"] || 0, :green)}

            #{Jura::Utils.format_bold('Description')}

            #{TTY::Markdown.parse(description)}
            TEMPLATE
          end
        end
      end
    end
  end
end
