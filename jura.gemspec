Gem::Specification.new do |s|
  s.name         = 'jura'
  s.version      = '0.0.5'
  s.date         = '2020-09-20'
  s.summary      = "Jura Guarrr!"
  s.description  = "A simple Jira CLI by Ruby"
  s.authors      = ["Hoa Nguyen"]
  s.email        = 'nvh0412@gmail.com'
  s.files        = ["lib/jura.rb"]
  s.homepage     = 'https://rubygems.org/gems/jura'
  s.executables << 'jura'
  s.license      = 'MIT'

  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'

  s.required_ruby_version = "~> 2.5"
  s.add_runtime_dependency "httparty", ">= 0.18.1", "< 0.21.0"
  s.add_runtime_dependency "tty-prompt", "~> 0.22"
  s.add_runtime_dependency "tty-table", "~> 0.12.0"
  s.add_runtime_dependency "tty-box", "~> 0.7.0"
  s.add_runtime_dependency "tty-markdown", "~> 0.7.0"
  s.add_runtime_dependency "tty-screen", "~> 0.8.1"
  s.add_runtime_dependency "tty-link", "~> 0.1.1"
  s.add_runtime_dependency "tty-spinner", "~> 0.9.3"
  s.add_runtime_dependency "pastel", "~> 0.8.0"
end
