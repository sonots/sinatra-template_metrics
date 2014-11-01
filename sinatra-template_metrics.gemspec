Gem::Specification.new do |spec|
  spec.name          = "sinatra-template_metrics"
  spec.version       = "0.0.1"
  spec.authors       = ["sonots"]
  spec.email         = ["sonots@gmail.com"]
  spec.summary       = %q{Instrument sinatra template rendering}
  spec.description   = %q{Instrument sinatra template rendering}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "sinatra"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
