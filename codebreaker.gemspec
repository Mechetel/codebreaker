require_relative "lib/codebreaker/version"

Gem::Specification.new do |spec|
  spec.name          = "codebreaker"
  spec.version       = Codebreaker::VERSION
  spec.authors       = ["mechetel"]
  spec.email         = ["dima.homa5@gmail.com"]

  spec.summary       = 'Codebreaker game'
  spec.description   = 'Second rubygarage task'
  spec.homepage      = 'https://github.com/mechetel/codebreaker'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.2")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mechetel/codebreaker"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry-byebug', '~> 3.9.0'
  spec.add_development_dependency 'i18n', '~> 1.8.10'
  spec.add_development_dependency 'rake', '~> 13.0.3'
  spec.add_development_dependency 'fasterer', '~> 0.9.0'
  spec.add_development_dependency 'rspec', '~> 3.10.0'
  spec.add_development_dependency 'rubocop', '~> 1.12.1'
  spec.add_development_dependency 'rubocop-performance', '~> 1.10.2'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.2.0'
  spec.add_development_dependency 'rubocop-rake', '~> 0.5.1'
  spec.add_development_dependency 'rubycritic', '~> 4.6.1'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
end
