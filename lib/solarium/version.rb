# Solarium (C) 2017 Peter "SaberUK" Powell <petpow@saberuk.com>

module Solarium

	# Public: The version number which is incremented when compatibility is broken.
	VERSION_MAJOR = 0

	# Public: The version number which is incremented when new features are added.
	VERSION_MINOR = 2

	# Public: The version number which is incremented when bugs are fixed.
	VERSION_PATCH = 1

	# Public: The version label which describes the status of the build.
	VERSION_LABEL = nil

	# Public: A string which contains the current version.
	VERSION = if VERSION_LABEL.nil?
		"#{VERSION_MAJOR}.#{VERSION_MINOR}.#{VERSION_PATCH}"
	else
		"#{VERSION_MAJOR}.#{VERSION_MINOR}.#{VERSION_PATCH}-#{VERSION_LABEL}"
	end
end
