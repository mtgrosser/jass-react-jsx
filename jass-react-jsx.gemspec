lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jass/react/jsx/version'

Gem::Specification.new do |s|
  s.name          = 'jass-react-jsx'
  s.version       = Jass::React::JSX::VERSION
  s.date          = '2021-10-15'
  s.authors       = ['Matthias Grosser']
  s.email         = ['mtgrosser@gmx.net']
  s.license       = 'MIT'

  s.summary       = 'Compile React JSX for Sprockets'
  s.homepage      = 'https://github.com/mtgrosser/jass-react-jsx'

  s.files = ['LICENSE', 'README.md'] + Dir['lib/**/*.rb']
  
  s.required_ruby_version = '>= 2.3.0'
  
  s.add_dependency 'nodo', '>= 1.5.6'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'minitest'
end
