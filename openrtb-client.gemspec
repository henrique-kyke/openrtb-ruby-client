# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'openrtb/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'openrtb-client'
  s.version     = OpenRTB::VERSION
  s.summary     = %Q{OpenRTB Ruby Client}
  s.description = %Q{OpenRTB Ruby Client}
  s.author      = 'Realmedia Latin America'
  s.email       = 'dev@realmediadigital.com'
  s.homepage    = 'http://github.com/realmedia/openrtb-ruby-client'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 1.9.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'addressable', '~> 2.3.6'
  s.add_dependency 'hashie',      '~> 3.2.0'
  s.add_dependency 'multi_json',  '~> 1.11.2'
  s.add_dependency 'naught',      '~> 1.0.0'
  s.add_dependency 'nesty',       '~> 1.0.2'
  s.add_dependency 'typhoeus',    '~> 0.6.9'

  s.add_development_dependency 'rake',     '~> 10.3'
  s.add_development_dependency 'minitest', '~> 5.2'
  s.add_development_dependency 'webmock',  '~> 1.18'
end
