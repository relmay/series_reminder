require_relative 'config'

module Helpers
  def get_series_with_zero(series)
    if series < 10
      return '0' + series.to_s
    else
      return series.to_s
    end
  end

  def get_filename_by_series(series, regexp)
    config = Config.instance
    magic_word = config.config["magic_word"]

    dir = Dir.entries('./')
    valid_filename = nil

    if regexp.nil?
      default_regexp = config.config["default_regex"]
      valid_regexp = default_regexp.gsub(magic_word, series)
    else
      valid_regexp = regexp.gsub(magic_word, series)
    end

    dir.each do |f| 
      if /#{valid_regexp}/.match?(f)
        valid_filename = f
        break
      end
    end

    valid_filename
  rescue RegexpError
    puts "Regex compiled incorrectly!"
    exit 1
  end

  def filename(series, regexp)
    get_filename_by_series(get_series_with_zero(series), regexp)
  end
end
