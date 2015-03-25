# encoding: utf-8
FactoryGirl.define do
  markdown = File.read('spec/fixtures/markdown.md')
  markdown_small = File.read('spec/fixtures/markdown-sm.md')
  description = "text123456" * 5
  ja_description = "あいうえおカナ漢字" * 5

  sequence :username do |n|
    "regular-user#{n}"
  end

  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :title do |n|
    "this is a title and i have at least 15 characters #{n}"
  end

  factory :user do
    username { generate :username }
    email { generate :email }
    password 'admin'
    # after(:create) do |user|
    #   create(:question, user:user)
    # end
  end

  factory :question do
    title { generate :title }
    description description
  end

  factory :question_by_ja, class: :question do
    title { generate :title }
    description ja_description
  end

  factory :question_with_markdown, class: :question do
    title { generate :title }
    description markdown
    # after(:create) do |question|
    #   create(:answer, question: question)
    # end!
  end

  factory :answer do
    description description
  end

  factory :answer_by_ja, class: :answer do
    description ja_description
  end

  factory :answer_with_markdown, class: :answer do
    description markdown_small
  end

end
