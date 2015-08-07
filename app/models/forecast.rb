class Forecast
  def initialize(query:, weather_api_klass: BarometerAdaptor)
    @query = query
    @weather_api_klass = weather_api_klass
  end

  def call
    forecast_presenter = ForecastPresenter.new(forecast)
    yield ForecastStatus.success(forecast_presenter.message)
  rescue StandardError => error
    yield ForecastStatus.error(error)
  end

  private

  def forecast
    @forecast ||= @weather_api_klass.new(query: @query).forecast
  end
end
