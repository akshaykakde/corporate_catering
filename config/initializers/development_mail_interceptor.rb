class DevelopmentMailInterceptor 
	def self.delivering_email(message)
		# message.subject = ""	
		message.to = ["kiranbdesh123@gmil.com"]
    mail(to:"kiranbdesh123@gmail.com",subject:"Email Interception")
	end
end