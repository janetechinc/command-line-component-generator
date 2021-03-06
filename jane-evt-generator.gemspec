# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'jane-evt-generator'
  s.version = '2.0.2.0'
  s.summary = 'Jane Command line Eventide component generator'
  s.description = ' '

  s.authors = ['Jane Technologies']
  s.homepage = 'http://iheartjane.com'
  s.licenses = ['Proprietary']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib,source}/**/*', File::FNM_DOTMATCH)
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4.0'

  s.bindir = 'executable'
  s.executables = Dir.glob('executable/*').map(&File.method(:basename))

  s.add_runtime_dependency 'thor'
  s.add_runtime_dependency 'evt-casing'

  s.add_development_dependency 'test_bench'
end
