# Solarium (C) 2017 Peter "SaberUK" Powell <petpow@saberuk.com>

require_relative 'lib/solarium/version'

Gem::Specification.new do |s|
	s.name        = 'solarium'
	s.description = 'A tool for working with generation data collected from the Enphase Envoy solar panel management system.'
	s.summary     = 'Enphase Envoy generation data manipulation tool.'
	s.version     = Solarium::VERSION

	s.executables           = %w(solarium-collect)
	s.files                 = Dir["bin/**/*"] + Dir["lib/**/*.rb"]
	s.required_ruby_version = '>= 2.1.0'
	s.license               = 'Apache-2.0'

	s.author   = 'Peter "SaberUK" Powell'
	s.email    = 'petpow@saberuk.com'
	s.homepage = 'https://github.com/SaberUK/solarium'

	s.add_dependency 'json',    '~> 2.1', '>= 2.1.0'
	s.add_dependency 'sequel',  '~> 5.1', '>= 5.1.0'
	s.add_dependency 'trollop', '~> 2.1', '>= 2.1.2'

	s.add_development_dependency 'rdoc',   '~> 5.1', '>= 5.1.0'
	s.add_development_dependency 'tomdoc', '~> 0.2.5'
end
