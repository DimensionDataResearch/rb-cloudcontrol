# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudcontrol/version'

Gem::Specification.new do |gem|
  gem.name          = "rb-cloudcontrol"
  gem.version       = Cloudcontrol::VERSION
  gem.summary       = %q{CloudControl API client}
  gem.description   = %q{Dimension Data CloudControl API client}
  gem.license       = "Apache"
  gem.authors       = ["tintoy"]
  gem.email         = "tintoy@tintoy.io"
  gem.homepage      = "https://rubygems.org/gems/rb-cloudcontrol"

  gem.files         = `git ls-files`.split($/)

  `git submodule --quiet foreach --recursive pwd`.split($/).each do |submodule|
    submodule.sub!("#{Dir.pwd}/",'')

    Dir.chdir(submodule) do
      `git ls-files`.split($/).map do |subpath|
        gem.files << File.join(submodule,subpath)
      end
    end
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency "httparty", ">= 0.14.0"

  gem.add_development_dependency 'bundler', '~> 1.10'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rdoc', '~> 4.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end
