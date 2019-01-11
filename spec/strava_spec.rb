require 'spec_helper'

describe Strava do
  let(:strava) { File.expand_path(File.join(__FILE__, '../../bin/strava')) }
  describe 'default' do
    subject do
      Strava::Shell.system!(['ruby', %("#{strava}")].join(' '))
    end
    it 'displays help' do
      expect(subject).to include 'strava - Command-line client for Strava'
    end
    it 'displays version' do
      expect(subject).to include Strava::Cli::VERSION
      expect(subject).to include Strava::VERSION
    end
  end
  describe 'help' do
    subject do
      Strava::Shell.system!(['ruby', %("#{strava}"), 'help'].join(' '))
    end
    it 'displays help' do
      expect(subject).to include 'strava - Command-line client for Strava'
    end
  end
  pending 'console'
end
