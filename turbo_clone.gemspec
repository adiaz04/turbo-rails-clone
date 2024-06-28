require_relative "lib/turbo_clone/version"

Gem::Specification.new do |spec|
  spec.name        = "turbo_clone"
  spec.version     = TurboClone::VERSION
  spec.authors     = ["Angel Diaz"]
  spec.email       = ["adiaz004@yahoo.com"]
  spec.summary     = "Turbo-rails clone"
  spec.license     = "MIT"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3.4"
end
