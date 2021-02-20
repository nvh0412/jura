# frozen_string_literal: true
require 'singleton'

module Jura
  class Configuration
    include Singleton

    def set_config(data)
      @config_obj = data
    end

    def freeze_config
      config_obj.freeze
    end

    def config_obj
      @config_obj ||= {}
    end
  end
end
