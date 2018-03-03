
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "eisiges/di/provider/rails/version"

Gem::Specification.new do |spec|
	spec.name          = "eisiges-di-provider-rails"
	spec.version       = Eisiges::DI::Provider::Rails::VERSION
	spec.authors       = ["Sam McCollum"]
	spec.email         = ["smccollum@mccollum.enterprises"]

	spec.summary       = %q{Rails provider for the DI system}
	#spec.description   = %q{TODO: Write a longer description or delete this line.}
	spec.homepage      = "http://localhost"

	# Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
	# to allow pushing to a single host or delete this section to allow pushing to any host.
	if spec.respond_to?(:metadata)
		spec.metadata["allowed_push_host"] = "'http://gems.mccollum.enterprises'"
	else
		raise "RubyGems 2.0 or newer is required to protect against " \
		      "public gem pushes."
	end

	spec.files = []
	spec.files         = `git ls-files -z`.split("\x0").reject do |f|
		f.match(%r{^(test|spec|features)/})
	end
	#puts "files         = #{spec.files}"

	spec.bindir        = "exe"
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.16"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "minitest", "~> 5.0"
	spec.add_development_dependency "pry"
	spec.add_dependency "eisiges-di-core", "~> 0.1.2"
	spec.add_dependency "eisiges-di-provider-default", "~> 0.1.2"
	spec.add_dependency "rails", ">=3.0", "<6.0"
end

