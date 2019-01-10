
Gem::Specification.new do |s|
  s.name = "pretty_round"
  s.version = "0.2.0"

  s.summary = "pretty rounding methods library"
  s.author = "diaphragm"
  s.description = "This gem provide useful numerical rounding methods such as nearest multiple or significant digits."
  s.license = "MIT"
  s.homepage = "https://github.com/diaphragm/ruby-pretty-round"

  s.required_ruby_version = '>=2.3'
  s.files = Dir['LICENSE', 'README.md', 'lib/**/*', 'test/**/*', 'examples/**/*']
end
