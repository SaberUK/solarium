# Solarium (C) 2017 Peter "SaberUK" Powell <petpow@saberuk.com>

require 'fileutils'

module Solarium

	# Public: Generates charts using the Dygraph API
	module Chart

		# Public: Generates charts and writes them to the output directory.
		#
		# output_dir - The directory to write the generated charts to.
		# data - The data to use when generating the chart.
		def self.generate output_dir, data
			FileUtils.mkdir_p output_dir unless Dir.exist? output_dir
			FileUtils.cp "#{__dir__}/index.html", output_dir

			self.generate_csv "#{output_dir}/generation.csv", data, 'Watts', :now
			self.generate_csv "#{output_dir}/today.csv", data, 'Watt Hours', :today
			self.generate_csv "#{output_dir}/week.csv", data, 'Watt Hours', :week
			self.generate_csv "#{output_dir}/lifetime.csv", data, 'Watt Hours', :lifetime
		end

		# Internal: Generates a CSV table for a single chart.
		#
		# file - The file to write the CSV table to.
		# data - The data to use when generating the CSV table.
		# title - The title to use for this table.
		# column - The column of data to use for this CSV table.
		def self.generate_csv file, data, title, column
			File.open file, 'w' do |fh|
				fh.puts "Time, #{title}"
				data.each do |entry|
					fh.puts "#{entry[:time]}, #{entry[column]}"
				end
			end
		end
	end
end
