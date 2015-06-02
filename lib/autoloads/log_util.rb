
module LogUtil

  def self.info(log_name, line)
    logger = Logger.new(Pathname.new(File.join(Rails.root, "log", log_name)))
    logger.info(line)
    puts line
  end

end