require 'pry'

class Parser
  attr_reader :log_data

  def initialize(log_data)
    @log_data = log_data
  end
end
