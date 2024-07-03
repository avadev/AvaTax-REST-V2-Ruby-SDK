require File.expand_path('../lib/avatax/version', __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency('rake', '~> 12.0.0')
  s.add_development_dependency('rspec', '~> 3.5.0')
  s.add_development_dependency('webmock', '>= 2.0.0')
  s.add_runtime_dependency('faraday', '>= 0.10')
  s.add_runtime_dependency('multi_json', '>= 1.0.3')
  s.add_runtime_dependency('activesupport', '>= 6.1.7')
  s.authors = ["Marcus Vorwaller"]
  s.description = %q{A Ruby wrapper for the AvaTax REST and Search APIs}
  s.email = ['marcus.vorwaller@avalara.com']
  s.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").select do |file|
      file.start_with?('LICENSE', 'README', 'example', 'lib')
    end
  end
  s.homepage = 'https://github.com/avadev/AvaTax-REST-V2-Ruby-SDK'
  s.name = 'avatax'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.required_rubygems_version = Gem::Requirement.new('>= 2.0.0') if s.respond_to? :required_rubygems_version=
  s.summary = %q{Ruby wrapper for the AvaTax API}
  s.version = AvaTax::VERSION.dup
end
