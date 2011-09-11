begin
  require "test/unit"
rescue LoadError => e
  if require "rubygems"
    retry
  else
    raise e
  end
end

$:.unshift File.join(File.dirname(__FILE__), "lib", "hector", "lib")
require "hector"

$:.unshift File.join(File.dirname(__FILE__), "lib", "hector", "test")
require "test_helper"

$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "hector/secret_channels"

require "logger"
SECRET_CHANNELS_TEST_LOG_DIR = File.expand_path(File.dirname(__FILE__) + "/../log")
Hector.logger = Logger.new(File.open(SECRET_CHANNELS_TEST_LOG_DIR + "/test.log", "w+"))
