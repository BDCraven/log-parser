require 'pry'
require 'log_data_validator'
require 'webpage_counter'

class Parser
  attr_reader :log_data

  def initialize(log_data)
    @log_data = log_data
  end

  def call
    log_lines = LogDataValidator.new.validate(log_data)
    WebpageCounter.new.webpage_counts_by_ip_address(log_lines)
  end
end
