class UserObserver < ActiveRecord::Observer 
	def after_create(user) 
		debugger
		UserMailer.deliver_scheduled_email(user)
	end 
end 