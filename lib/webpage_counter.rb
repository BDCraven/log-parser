class WebpageCounter
  attr_reader :sum_ip_addresses_by_webpage, :views_per_page, :unique_views_per_page
  def initialize
    @sum_ip_addresses_by_webpage = {}
    @views_per_page = {}
    @unique_views_per_page = {}
  end

  def call
    count_ip_addresses_by_webpage
    total_views_per_webpage
    total_unique_views_per_webpage
  end

  def count_ip_addresses_by_webpage(log_lines)
    log_lines.each do |line|
      webpage = line[0]
      ip_address = line[1]
      if @sum_ip_addresses_by_webpage[webpage]
        @sum_ip_addresses_by_webpage[webpage][ip_address] += 1
      else
        @sum_ip_addresses_by_webpage[webpage] = Hash.new(0)
        @sum_ip_addresses_by_webpage[webpage][ip_address] = 1
      end
    end
    @sum_ip_addresses_by_webpage
  end

  def total_views_per_webpage(sum_ip_addresses_by_webpage)
    sum_ip_addresses_by_webpage.each do |key, value|
      @views_per_page[key] = value.values.sum
    end
    @views_per_page
  end

  def total_unique_views_per_webpage(sum_ip_addresses_by_webpage)
    sum_ip_addresses_by_webpage.each do |key, value|
      @unique_views_per_page[key] = value.length
    end
    @unique_views_per_page
  end
end
