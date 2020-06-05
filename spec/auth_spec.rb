require 'spec_helper'

describe Strava do
  describe 'auth' do
    it 'shuts down server when launchy fails' do
      expect(Launchy).to receive(:open).and_yield('failed')
      auth = Strava::Cli::Auth.new(client_id: 'foo', client_secret: 'bar')
      expect { auth.access_token }.to raise_error(/Failed to browse to [^\s]*: failed/)
    end
  end
end
