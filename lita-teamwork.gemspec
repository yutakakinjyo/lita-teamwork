Gem::Specification.new do |spec|
  spec.name          = "lita-teamwork"
  spec.version       = "0.4.1"
  spec.authors       = ["yutakakinjyo"]
  spec.email         = ["yutakakinjyo@gmail.com"]
  spec.description   = "for teamwork on chat. alpha version"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/yutakakinjyo/lita-teamwork"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.6"
  spec.add_runtime_dependency "octokit"
  spec.add_runtime_dependency "dotenv"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
