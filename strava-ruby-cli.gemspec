$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'cli/version'

Gem::Specification.new do |s|
  s.name = 'strava-ruby-cli'
  s.bindir = 'bin'
  s.executables = ['strava']
  s.version = Strava::Cli::VERSION
  s.authors = ['Daniel Doubrovkine']
  s.email = 'dblock@dblock.org'
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = Dir['{bin,lib}/**/*'] + ['README.md', 'LICENSE.md', 'CHANGELOG.md']
  s.require_paths = ['lib']
  s.homepage = 'http://github.com/dblock/strava-ruby-cli'
  s.licenses = ['MIT']
  s.summary = 'Strava API CLI.'
  s.add_dependency 'gli'
  s.add_dependency 'launchy'
  s.add_dependency 'ripl'
  s.add_dependency 'strava-ruby-client'
end
