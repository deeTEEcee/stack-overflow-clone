class Answer
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :question

	field :description, type: String
end