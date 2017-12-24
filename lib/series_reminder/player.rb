require_relative "config"

module Player
  @config = Config.instance

  def self.open_videoplayer(filename)
    system("#{@config.config["videoplayer_exec"]} \"#{filename}\"")
  end

  def self.open_next()
    next_series = get_last + 1
    set_last(next_series)
    open_series(next_series)
  end

  def self.open(filename)
    if filename.nil?
      puts "File not found!"
    else
      open_videoplayer(filename)
    end
  end
end
