class ParserFormatter
  def printwebpages(counted_webpage_views)
    counted_webpage_views.each do |result|
      puts "#{result[0]} #{result[1]} visits"
    end
  end

  def printuniquewebpages(counted_webpage_views)
    counted_webpage_views.each do |result|
      puts "#{result[0]} #{result[1]} unique views"
    end
  end

  def sort_by_views_descending(counted_webpage_views)
      counted_webpage_views.sort_by {|_key, value| value}.reverse
  end
end
