module QuestionsHelper
  def question_short_url(question)
    question_url(question, question.title.truncate(40, omission:'', separator:' ').parameterize)
  end
end
