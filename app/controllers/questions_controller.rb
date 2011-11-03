class QuestionsController < ApplicationController
  
  def ask_question
    @question = Question.find(params[:id])
  end
  
end
