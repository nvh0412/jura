# frozen_string_literal: true

module Jura
  module Command
    module Board
      class Select
        def self.execute
          prompt = TTY::Prompt.new

          boards = Jura::Component::Spinner.render do
            Api::Board.all
          end

          board = prompt.select("Choose your board?", filter: true, per_page: 10) do |menu|
            boards.each do |b|
              menu.choice b['location']['displayName'], b
            end
          end

          config = Jura::Configuration.instance.load_config
          config['selected_board_id'] = board['id']
          config['selected_board_name'] = board['location']['displayName']

          Jura::Configuration.instance.save_config(config)
        end
      end
    end
  end
end
