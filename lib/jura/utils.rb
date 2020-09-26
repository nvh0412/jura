# frozen_string_literal: true

module Jura
  class Utils
    class << self
      COLOR = {
        :red => 31,
        :pink => 31,
        :blue => 34,
        :green => 32,
        :lime => 32,
        :black => 37,
        :white => 37,
        :purple => 35,
        :yellow => 33,
        :orange => 33,
        :cyan => 36,
        :sky => 36
      }

      def paint(string, color)
        code = COLOR.fetch(color)

        "\e[#{code}m#{string}\e[0m"
      end

      def format_bold(string)
        "\e[1m#{string}\e[0m"
      end
    end
  end
end
