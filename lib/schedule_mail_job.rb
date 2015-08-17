class ScheduleMailJob < Struct.new(:mail) 
   def perform
	UserMailer.scheduled_email(mail).deliver
   end
 end
