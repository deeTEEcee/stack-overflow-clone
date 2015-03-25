include FactoryGirl::Syntax::Methods

unless User.where(username: 'admin1234').exists?
  user = create(:user, username: 'admin123', password: 'admin')
  user2 = create(:user, username: 'deeteecee', password: 'dtc')

  question = create(:question,  user:user)
  create(:question_by_ja, user: user)
  create(:question_with_markdown, user: user)

  create(:answer, question: question, user: user2 )
  create(:answer_by_ja, question: question, user: user2)
  create(:answer_with_markdown, question: question, user: user2)
end
