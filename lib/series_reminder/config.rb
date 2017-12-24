require 'yaml'
require 'singleton'

class Config
  include Singleton

  attr_reader :config

  DEFAULT_CONFIG = {
    "videoplayer_exec" => "mpv",
    "default_regex" => "[Ee]%%SERIES%%",
    "series_filename" => ".series",
    "magic_word" => "%%SERIES%%"
  }

  def initialize()
    load_config_file!(File.join(Dir.home, ".config/series_reminder/config.yml"))
  end


  def load_config_file!(config_location)
    @config = YAML::load_file(config_location)

    if (@config == false) 
      @config = DEFAULT_CONFIG
    else
      complete_with_default_config!
    end
  rescue Errno::ENOENT
    @config = DEFAULT_CONFIG
  end

  def complete_with_default_config!
    DEFAULT_CONFIG.each do |a, b|
      if (@config[a] == nil)
        @config[a] = b
      end
    end
  end
end
