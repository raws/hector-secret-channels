spec = Gem::Specification.new do |s|
  s.name = "hector-secret-channels"
  s.version = "1.0.0"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Ross Paffett"]
  s.email = ["ross@rosspaffett.com"]
  s.homepage = "http://github.com/raws/hector-secret-channels"
  s.summary = "Secret channels for Hector"
  s.description = "A Hector extension which hides channels from people who are not in them"
  s.files = Dir["lib/**/*.rb"]
  s.require_path = "lib"
  
  s.add_dependency "hector", "1.0.4"
end
