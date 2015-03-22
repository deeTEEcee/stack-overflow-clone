class Answer
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :question

	field :description, type: String

	validates :description, presence: true, length: { minimum: 30, maximum: 30000 }

end