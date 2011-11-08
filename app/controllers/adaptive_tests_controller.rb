class AdaptiveTestsController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def run
    @adaptive_test = AdaptiveTest.find(params[:id])
    @test_questions = @adaptive_test.questions.scoped
    session[:begin_time] ||= Time.now
    session[:right_answers] ||= 0
  end
  
  def index
    @adaptive_tests = AdaptiveTest.scoped(:order => :id)
  end
  
  def results
    end_time = Time.now
    begin_time = session[:begin_time]
    if not begin_time.nil?
      @result_time = end_time - begin_time
    end
    @right_answers = session[:right_answers]
    session[:begin_time] = nil
    session[:right_answers] = nil
  end
  
  def check_answer
    adaptive_test = AdaptiveTest.find(params[:id])
    question = Question.find(params[:question])
    @answers = question.answers
    @answer_object = @answers.find(params[:answer])
    if @answer_object.right
      session[:right_answers] += 1
    end
    
    if params[:first_last] == "first"
      redirect_to "#{run_test_path}?page=#{session[:question_page]}"
      end
      if params[:first_last] == "last"
      redirect_to results_path(adaptive_test)
    end
  end
    
end
