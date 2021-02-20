# frozen_string_literal: true
require 'singleton'

module Jura
  class Configuration
    include Singleton

    CONFIG_FILE_PATH = "~/.jura.config.json"

    def set_config(data)
      @config_obj = data
    end

    def freeze_config
      config_obj.freeze
    end

    def config_obj
      @config_obj ||= {}
    end

    def load_config
      config_path = File.expand_path(CONFIG_FILE_PATH)

      if File.exist?(config_path)
        JSON.parse(File.read(config_path))
      else
        {}
      end
    end

    def save_config(config)
      File.write(File.expand_path(CONFIG_FILE_PATH), config.to_json)
    end
  end
end
