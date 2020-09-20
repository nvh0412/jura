Gem::Specification.new do |s|
  s.name         = 'jura'
  s.version      = '0.0.1'
  s.date         = '2020-09-20'
  s.summary      = "Jura Guarrr!"
  s.description  = "A simple Jira CLI by Ruby"
  s.authors      = ["Hoa Nguyen"]
  s.email        = 'nvh0412@gmail.com'
  s.files        = ["lib/jura.rb"]
  s.homepage     = 'https://rubygems.org/gems/jura'
  s.license      = 'MIT'

  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'

  s.required_ruby_version = "~> 2.5"
  s.add_runtime_dependency "tty-prompt", "~> 0.22"
end
