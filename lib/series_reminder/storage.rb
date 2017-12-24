require_relative 'config'

class Storage
  def initialize
    @config = Config.instance

    if file_exist?
      @store = File.readlines(@config.config["series_filename"])
    else
      @store = []
    end
  end

  def store_valid?
    if file_exist?
      return !(@store.length < 1 )
    else
      return false
    end
  end

  def file_exist?
    File.exist? @config.config["series_filename"]
  end

  def check_store
    if !store_valid?
      puts "Storage data is invalid!"
      exit
    end
  end

  def get_last
    if (!file_exist?)
      init_file
    end

    check_store
    @store[0].to_i
  end

  def set_last(series)
    @store[0] = series.to_s
    update_store()
  end

  def update_store()
    File.open(@config.config["series_filename"], 'w') do |file|
      @store.each do |item|
        file.puts item
      end
    end
  end

  def get_regexp()
    if (@store[1].nil?)
      return nil
    else
      return @store[1][0..-2]
    end
  end

  def set_regexp(regexp)
    @store[1] = regexp
    update_store()
  end

  def init_file()
    if store_valid?
      puts "Already initialized!"
    else
      set_last 0 
      puts "Successfully initialized."
    end
  end
end
