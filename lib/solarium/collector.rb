# Solarium (C) 2017 Peter "SaberUK" Powell <petpow@saberuk.com>

module Solarium

	# Public: Collects generation information from the Envoy API.
	class Collector

		# Public: Either an exception that was thrown during collection or nil.
		attr_reader :error

		# Public: The number of watt hours which have been generated since the system was installed.
		attr_reader :lifetime

		# Public: The number of watts currently being generated.
		attr_reader :now

		# Public: The number of watt hours which have been generated today.
		attr_reader :today

		# Public: The number of watt hours which have been generated in the last week.
		attr_reader :week

		# Public: Initializes a new instance of the Solarium::Collector class.
		#
		# url - The URL of the Envoy web interface.
		def initialize url
			collect url
		rescue ::Exception => error
			@error = error
		end

		# Internal: Collects generation information from the Envoy API.
		#
		# url - The URL of the Envoy web interface.
		private def collect url
			uri = URI.parse url
			uri.path = '/api/v1/production'

			body = open(uri).read
			json = JSON.parse body

			@now      = json['wattsNow']
			@today    = json['wattHoursToday']
			@week     = json['wattHoursSevenDays']
			@lifetime = json['wattHoursLifetime']
		end
	end
end
