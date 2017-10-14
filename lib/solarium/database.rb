# Solarium (C) 2017 Peter "SaberUK" Powell <petpow@saberuk.com>

module Solarium

	# Public: Implements logic for interacting with the Solarium database.
	class Database

		# Public: Either an exception that was thrown during database connection or nil.
		attr_reader :error

		# Public: Initializes a new instance of the Solarium::Database class.
		#
		# url - The URL for connecting to the SQL database.
		def initialize url
			connect url
		rescue ::Exception => error
			@error = error
		end

		# Public: Stores the information provided by a Solarium::Collector in the database.
		#
		# collector - An instance of the Solarium::Collector class containing information to store.
		def insert collector
			row = {
				time: DateTime.now,
				now: collector.now,
				today: collector.today,
				week: collector.week,
				lifetime: collector.lifetime
			}
			@connection[:solarium].insert row
		end

		# Public: Reads the specified number of days worth of data from the database.
		#
		# days - The number of days worth of data to read.
		def select_days days
			data = @connection[:solarium].where do
				time > DateTime.now - days
			end
			return data.to_a
		end

		# Internal: Connects to the database and creates the table if required.
		#
		# url - The URL for connecting to the SQL database.
		private def connect url
			@connection = Sequel.connect url
			@connection.create_table? :solarium do
				column :time, DateTime, primary_key: true
				column :now, Integer, null: false
				column :today, Integer, null: false
				column :week, Integer, null: false
				column :lifetime, Integer, null: false
			end
		end

	end
end
