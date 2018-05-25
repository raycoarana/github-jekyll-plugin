lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-github-plugin/version"
Gem::Specification.new do |spec|
  spec.name          = "jekyll-github-plugin"
  spec.summary       = "Plug-in for jekyll to show a GitHub project in your pages."
  spec.description   = "Plug-in for jekyll to show a GitHub project in your pages."
  spec.version       = JekyllGithubPlugin::VERSION
  spec.authors       = ["Rayco Araña"]
  spec.email         = ["me@raycoarana.com"]
  spec.homepage      = "https://github.com/raycoarana/jekyll-github-plugin"
  spec.licenses      = ["Apache-2.0"]
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!)  }
  spec.require_paths = ["lib"]
  spec.add_dependency "jekyll", "~> 3.0"
  spec.add_development_dependency "rake", "~> 11.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "rubocop", "~> 0.52"
end
