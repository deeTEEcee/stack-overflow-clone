class User
	include Mongoid::Document
	include Mongoid::Timestamps::Created


	field :username, type: String
	field :email, type: String
	field :crypted_password, type: String
	field :salt, type: String
	has_many :questions, validate: false
end