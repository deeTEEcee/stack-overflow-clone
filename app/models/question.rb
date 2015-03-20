class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Mongoid::Token

  belongs_to :user

  field :title, type: String
  field :description, type: String
  token
end