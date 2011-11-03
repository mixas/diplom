class AdaptiveTestsController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def run
    @adaptive_test = AdaptiveTest.find(params[:id])
    @questions = @adaptive_test.questions
    redirect_to ask_question_path(get_question_id)
  end
  
  def next_question
    redirect_to ask_question_path(get_question_id)
  end
  
  private
  
   def get_question_id
     unless @number.nil?
       @number = @questions.shift.id
     else
       @number = @questions.first.id
     end
   end
 
  
end
