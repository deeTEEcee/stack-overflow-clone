require_relative 'acceptance_helper'

def generate_question
  FactoryGirl.build(:question_by_ja)
end

def generate_answer
  FactoryGirl.build(:answer_by_ja)
end

feature "Questions" do

  given(:user1) { FactoryGirl.create(:user) }
  given(:user2) { FactoryGirl.create(:user) }

  feature "User1" do
    scenario "can be create and answer one's own question" do
      login(user1)

      # create multiple questions
      2.times do
        click_on t('header.ask_question')
        question = generate_question
        fill_form(:user, {
          'question_title' => question.title,
          'question_description' => question.description
        })
        click_on t('page.question.form.post')
      end

      # answer a question
      visit '/'
      first('.question-link').click
      answer = generate_answer
      byebug
      fill_form(:session, {
        'answer_description' => answer.description
      })
      click_on t('page.question.answer.post')
    end
  end

  feature "User2" do
    scenario "can participate in other questions" do
      login(user2)

      # answer user1's already answered question
      first('.question-link').click
      answer = generate_answer
      fill_form(:session, {
        'answer_description' => answer.description
      })
      click_on t('page.question.answer.post')

      visit '/'
      # answer user1's unanswered question
      all('.question-link')[1].click
      answer = generate_answer
      fill_form(:session, {
        'answer_description' => answer.description
      })
      click_on t('page.question.answer.post')
    end
  end
end
