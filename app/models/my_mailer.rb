class MyMailer < ActiveRecord::Base
	has_many :jobs, :class_name => "Delayed::Job"
	validates :email,:schedule_time,:body,:subject, presence: true
	validates_uniqueness_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates :email, :email_format => { :message => 'invalid format' }

	def self.get_mailers
    	my_mailers = []
    	Delayed::Job.all.pluck(:owner_id).each{|e| my_mailers << MyMailer.find(e)}
    	my_mailers = my_mailers.sort { |x,y| x.schedule_time <=> y.schedule_time } if my_mailers.count >1
    	my_mailers
    end
end
