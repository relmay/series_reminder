require_relative 'storage'
require_relative 'helpers'
require_relative 'player'
require_relative 'config'

module SeriesReminder
  class Series
    include Helpers

    def initialize
      @storage = Storage.new
    end

    def open_series(series)
      Player.open(filename(series, @storage.get_regexp))
    end

    def open_next
      next_series = @storage.get_last + 1

      Player.open(filename(next_series, @storage.get_regexp))

      @storage.set_last(next_series)
    rescue Interrupt
      @storage.set_last(next_series)
    end

    def open_config_file(config_location)
      config = Config.instance
      config.load_config_file!(config_location)
    end

    def get_last_series
      @storage.get_last
    end

    def set_regexp(regexp)
      @storage.set_regexp(regexp)
    end

    def init_storage
      @storage.init_file
    end

    def set_last_series(series)
      @storage.set_last(series)
    end
  end
end
