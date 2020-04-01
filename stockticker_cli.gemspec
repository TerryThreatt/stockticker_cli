require_relative 'lib/stockticker_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "stockticker_cli"
  spec.version       = StocktickerCli::VERSION
  spec.authors       = ["TerryThreatt"]
  spec.email         = ["terry.threatt@gmail.com"]

  spec.summary       = %q{This application will use the command-line to query any stock ticker symbol and return the current price.}
  spec.description   = %q{Real-time stock quote app.}
  spec.homepage      = "https://github.com/TerryThreatt/stockticker_cli/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/profiles/manwittaplan"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/TerryThreatt/stockticker_cli/"
  spec.metadata["changelog_uri"] = "https://github.com/TerryThreatt/stockticker_cli/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["stockticker"] 
  spec.require_paths = ["lib"]

  spec.add_development_dependency('gem-release')
  spec.add_dependency('pry')
  spec.add_dependency('json')
  spec.add_dependency('rest-client')
  spec.add_dependency('dotenv')
end
