require 'rails_helper'

RSpec.describe ForecastPresenter, type: :model do
  subject(:presenter) { described_class.new(forecast) }
  let(:date) { Date.parse('2015-01-01') }
  let(:forecast) do
    [ double('prediction', high: 100, low: 0, emoji: ':sunny:', date: date),
      double('prediction', high: 99, low: 1, emoji: ':cloudy:', date: date + 1.day) ]
  end

  describe '#message' do
    it 'presents a forecast in a text message' do
      expected = "* 1 Jan* :sunny: High: 100, Low: 0\n* 2 Jan* :cloudy: High: 99, Low: 1\n"
      expect(presenter.message).to eq(expected)
    end
  end
end
