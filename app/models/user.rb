class User
	include Mongoid::Document
	include Mongoid::Timestamps::Created
	authenticates_with_sorcery!
	
	attr_accessor :password_confirmation
	validates_presence_of :username

end