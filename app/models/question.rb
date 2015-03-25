class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :answers, validate: false

  field :title, type: String #, localize: true
  field :description, type: String# , localize: true

  validates :title,
    presence:true,
    length: { minimum: 15,  maximum: 150},
    uniqueness: true
  validates :description,
    presence:true,
    length: { minimum: 30, maximum: 30000 }

  def short_url
    question_path(self, self.title.truncate(40, omission:'', separator:' ').parameterize)
  end

  def default_url_options(options={})
    {:locale => Rails.application.config.i18n.default_locale}
  end

end
