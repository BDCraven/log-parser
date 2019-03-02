class WebpageCounter
  attr_reader :page_views
  def initialize
    @page_views = {}
  end

  def webpage_counts_by_ip_address(log_lines)
    log_lines.each do |line|
      webpage = line[0]
      ip_address = line[1]
      if @page_views[webpage]
        @page_views[webpage][ip_address] += 1
      else
        @page_views[webpage] = Hash.new(0)
        @page_views[webpage][ip_address] = 1
      end
    end
  end
end
