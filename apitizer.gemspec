lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'apitizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'apitizer'
  spec.version       = Apitizer::VERSION
  spec.authors       = [ 'Ivan Ukhov' ]
  spec.email         = [ 'ivan.ukhov@gmail.com' ]
  spec.summary       = 'The main ingredient of a RESTful API client'
  spec.description   = 'A Ruby library that provides a flexible engine ' \
                       'for developing RESTful API clients.'
  spec.homepage      = 'https://github.com/IvanUkhov/apitizer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = [ 'lib' ]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'rack', '~> 1.5'
  spec.add_dependency 'json', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
  spec.add_development_dependency 'webmock', '~> 1.18'
end
