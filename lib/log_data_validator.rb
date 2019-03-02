class LogDataValidator
  def validate(log_data)
    valid_log_lines = split_into_lines(log_data)
    error unless valid_log_lines.all? { |line| line.length == 2 }
    valid_log_lines
  end

  private

  def split_into_lines(log_data_string)
    log_data_string.split("\n").map(&:split)
  end

  def error
    raise LogDataError, 'Log data not in expected format e.g. /webpage/ ip_address\n'
  end

  class LogDataError < StandardError; end
end
