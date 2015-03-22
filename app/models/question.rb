class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  belongs_to :user
  has_many :answers, validate: false

  field :title, type: String
  field :description, type: String

  validates :title, presence:true, length: { minimum: 15,  maximum: 150}, uniqueness: true
  validates :description, presence:true, length: { minimum: 30, maximum: 30000 }


end