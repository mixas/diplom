class AllTestsController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def run
    @all_test = AllTest.find(params[:id])
    @test_questions = @all_test.questions.paginate(:per_page => 1, :page => params[:page])
    session[:begin_time] ||= Time.now
    session[:right_answers] ||= 0
  end
  
  def index
    @all_tests = AllTest.scoped(:order => :id)
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
    all_test = AllTest.find(params[:id])
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
        redirect_to results_path(all_test)
    end
  end
    
end
