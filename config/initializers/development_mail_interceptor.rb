class DevelopmentMailInterceptor 
	def self.delivering_email(message)
		# message.subject = ""	
		message.to = ["bhuvna@joshsoftware.com"]
	end
end