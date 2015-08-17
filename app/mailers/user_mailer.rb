class UserMailer < ApplicationMailer
	def scheduled_email(user) 
		@user = user
		mail(:to => @user.email, 
			:subject => @user.subject,
			:from => "yuvasoft@gmail.com",
			:body => @user.body,
			:sent_on => @user.schedule_time)
	end 
end
