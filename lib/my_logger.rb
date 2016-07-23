#code adapted from adriana chis class tutorial on singleton patterns
require 'singleton'

class MyLogger
	include Singleton

	def initialize
		@log = File.open("userlog.txt", "a")
	end

	def logInformation(information)
		@log.puts(information)
		@log.flush
	end
end