require 'pry'
require 'log_data_validator'

class Parser
  attr_reader :log_data

  def initialize(log_data)
    @log_data = log_data
  end

  def call
    LogDataValidator.new.validate(log_data)
  end
end
