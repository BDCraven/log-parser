require 'pry'
require_relative './log_data_validator'
require_relative './webpage_counter'
require_relative './parser_formatter'

class Parser
  attr_reader :log_data

  def initialize(log_data)
    @log_data = log_data
  end

  def call
    count_webpages(validated_log_data)
    sort_data
    print_results
  end

  def count_webpages(log_lines)
    @counted_webpage_views ||= webpage_counter.count_ip_addresses_by_webpage(log_lines)
  end

  def validated_log_data
    @validated_log_data = LogDataValidator.new.validate(log_data)
  end

  def webpage_counter
    @webpage_counter ||= WebpageCounter.new
  end

  def sort_data
    @sorted_views_per_webpage = parser_formatter.sort_by_views_descending(page_views_by_ip_address)
    @sorted_unique_views_per_webpage = parser_formatter.sort_by_views_descending(total_unique_views_per_webpage)
  end

  def parser_formatter
    @parser_formatter ||= ParserFormatter.new
  end

  def page_views_by_ip_address
    webpage_counter.total_views_per_webpage(@counted_webpage_views)
  end

  def total_unique_views_per_webpage
    webpage_counter.total_unique_views_per_webpage(@counted_webpage_views)
  end

  def print_results
    parser_formatter.printwebpages(@sorted_views_per_webpage)
    parser_formatter.printuniquewebpages(@sorted_unique_views_per_webpage)
  end
end
