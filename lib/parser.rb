require 'pry'

class Parser
  attr_reader :log_data

  def initialize(log_data)
    @log_data = log_data
  end

  def call
    log_lines = validate(@log_data)
  end

  def validate(log_data)
    log_lines = split_into_lines(log_data)
    error unless log_lines.all? {|line| line.length == 2}
    log_lines
  end

  def split_into_lines(log_data_string)
    log_data_string.split("\n").map{|line| line.split}
  end

  def error
    raise LogDataError, 'Log data not in expected format e.g. /webpage/ ip_address\n'
  end

  class LogDataError < StandardError; end
end
