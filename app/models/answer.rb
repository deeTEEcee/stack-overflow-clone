class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :question
  belongs_to :user

  field :description, type: String

  validates :description, presence: true, length: { minimum: 30, maximum: 30000 }

end
