class ForecastPresenter
  def initialize(forecast)
    @forecast = forecast
  end

  def message
    @forecast.each_with_object('') do |f, message|
      message << "*#{f.date.to_s(:short)}* #{f.emoji} High: #{f.high}, Low: #{f.low}\n"
    end
  end
end
