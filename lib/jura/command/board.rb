# frozen_string_literal: true

module Jura
  module Command
    class Board
      def self.execute!(sub_cmd, args)
        case sub_cmd
        when "list"
          boards = Api::Board.all
          puts Component::Board.render(boards)
        when "select"
          prompt = TTY::Prompt.new
          boards = Api::Board.all
          board = prompt.select("Choose your board?", filter: true, per_page: 10) do |menu|
            boards.each do |b|
              menu.choice b['location']['displayName'], b
            end
          end

          config = Jura::Configuration.instance.load_config
          config['selected_board_id'] = board['id']
          config['selected_board_name'] = board['location']['displayName']

          Jura::Configuration.instance.save_config(config)
        when "add"
        end
      end
    end
  end
end
