class MyMailer < ActiveRecord::Base
	has_many :jobs, :class_name => "Delayed::Job"


	def self.get_mailers
    	my_mailers = []
    	Delayed::Job.all.pluck(:owner_id).each{|e| my_mailers << MyMailer.find(e)}
    	my_mailers = my_mailers.sort { |x,y| x.schedule_time <=> y.schedule_time } if my_mailers.count >1
    	my_mailers
    end
end
