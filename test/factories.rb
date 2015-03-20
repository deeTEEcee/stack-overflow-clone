# for now, just to test models
FactoryGirl.define do
  factory :user do
    username 'dtc'
    after(:create) do |user|
      create(:question, user:user)
    end
  end

  factory :question do
    title 'question'
    description 'qdescription'
    after(:create) do |question|
      create(:answer, question: question)
    end
  end

  factory :answer do
    description 'adescription'
  end
end