# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pi_charts/version'

Gem::Specification.new do |spec|
  spec.name          = "pi_charts"
  spec.version       = PiCharts::VERSION
  spec.authors       = ["Kent Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{A ruby gem to easily build beautiful charts using chartjs.}
  spec.description   = %q{A ruby gem to easily build beautiful charts using chartjs. If you like charts, ruby, and want beautiful javascript charts.}
  spec.homepage      = "https://github.com/picatz/Pi-Charts"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
 
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
