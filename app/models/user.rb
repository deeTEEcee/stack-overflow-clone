class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  authenticates_with_sorcery!

  attr_accessor :password_confirmation

  validates :username,
    presence: true,
    uniqueness: true,
    length: { minimum: 6, maximum: 25},
    format: { with: /\A[\w-]+\Z/ }
  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: 3 }
  validates :email,
    presence: true,
    uniqueness: true,
    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
