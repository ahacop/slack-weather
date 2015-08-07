class BarometerAdaptor
  def initialize(query:)
    @query = query
  end

  def forecast
    forecast = Barometer.new(@query).measure.forecast
    @forecast ||= forecast.map do |prediction|
      Prediction.new(prediction.starts_at.to_date,
                     prediction.high.f,
                     prediction.low.f,
                     emoji_for_icon(prediction.icon))
    end
  end

  private

  def emoji_for_icon(icon)
    case icon
    when /fog/
      ':fog:'
    when /partlycloudy/, /partlysunny/
      ':partly_sunny:'
    when /rain/, /tstorm/
      ':umbrella:'
    when /cloud/
      ':cloud:'
    when /sun/, /clear/
      ':sunny:'
    when /snow/, /sleet/, /flurries/
      ':snowflake:'
    else
      ':question:'
    end
  end
end
