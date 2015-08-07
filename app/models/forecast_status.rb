class ForecastStatus
  def self.success(message)
    ForecastSuccess.new(message)
  end

  def self.error(error)
    ForecastError.new(error)
  end

  def initialize(status)
    @status = status
  end

  def on_error; end
  def on_success; end
end

class ForecastSuccess < ForecastStatus
  def on_success
    yield(@status)
  end
end

class ForecastError < ForecastStatus
  def on_error
    yield(@status)
  end
end
