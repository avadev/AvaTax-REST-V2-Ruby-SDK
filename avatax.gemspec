require File.expand_path('../lib/avatax/version', __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency('rake', '~> 12.0.0')
  s.add_development_dependency('rspec', '~> 3.5.0')
  s.add_development_dependency('webmock', '>= 2.0.0')
  s.add_runtime_dependency('faraday', '>= 0.10')
  s.add_runtime_dependency('faraday_middleware', '>= 0.10')
  s.add_runtime_dependency('multi_json', '>= 1.0.3')
  s.add_runtime_dependency('hashie', '>= 3.0.0')
  s.authors = ["Marcus Vorwaller"]
  s.description = %q{A Ruby wrapper for the AvaTax REST and Search APIs}
  s.post_install_message =<<eos
********************************************************************************

AvaTax REST API
------------------------------
Our developer site documents the AvaTax REST API.
(http://developer.avatax.com).
Blog
----------------------------
The Developer Blog is a great place to learn more about the API and AvaTax integrations
Subscribe to the RSS feed be notified of new posts:
(http://developer.avatax.com/blog).

********************************************************************************
eos
  s.email = ['marcus.vorwaller@avalara.com']
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files = `git ls-files`.split("\n")
  s.homepage = 'https://github.com/avadev/AvaTax-REST-V2-Ruby-SDK'
  s.name = 'avatax'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.required_rubygems_version = Gem::Requirement.new('>= 2.0.0') if s.respond_to? :required_rubygems_version=
  s.summary = %q{Ruby wrapper for the AvaTax API}
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = AvaTax::VERSION.dup
end
