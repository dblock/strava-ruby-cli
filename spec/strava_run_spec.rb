require 'spec_helper'

describe Strava do
  let(:strava) { File.expand_path(File.join(__FILE__, '../../bin/strava')) }
  describe 'run' do
    subject do
      Strava::Shell.system!([
        'ruby', %("#{strava}"),
        '--client_id=id',
        '--client_secret=secret',
        '--access_token=token',
        'run', 'athlete.name'
      ].join(' '))
    end
    pending 'executes athlete.name'
  end
end
