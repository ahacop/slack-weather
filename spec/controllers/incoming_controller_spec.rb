require 'rails_helper'

RSpec.describe IncomingController, type: :controller do
  let(:params) do
    {
      'token': 'token',
      'team_id': 'team_id',
      'team_domain': 'team_domain',
      'channel_id': 'channel_id',
      'channel_name': 'directmessage',
      'user_id': 'user_id',
      'user_name': 'user',
      'command': '/weather',
      'text': '21201',
    }
  end
end
