class IncomingController < ApplicationController
  def receive
    Forecast.new(query: params[:text]).call do |result|
      result.on_success do |message|
        render plain: message
      end

      result.on_error do |error|
        head :unprocessable_entity
      end
    end
  end
end
