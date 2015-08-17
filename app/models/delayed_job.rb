class Delayed::Job < ActiveRecord::Base
	belongs_to :owner,:class_name => "MyMailer"
end
