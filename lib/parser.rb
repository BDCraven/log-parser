require 'pry'
require_relative './log_data_validator'
require_relative './webpage_counter'

class Parser
  attr_reader :log_data

  def initialize(log_data)
    @log_data = log_data
  end

  def call
    log_lines = LogDataValidator.new.validate(log_data)
    counter = WebpageCounter.new
    page_views_by_ip_address = counter.count_ip_addresses_by_webpage(log_lines)
    counter.total_views_per_webpage(page_views_by_ip_address).to_s + " " + counter.total_unique_views_per_webpage(page_views_by_ip_address).to_s
  end
end
