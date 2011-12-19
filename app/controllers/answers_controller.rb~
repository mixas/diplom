class AnswersController < InheritedResources::Base

def index
  @answers = Answer.scoped(params[:id]).paginate(:per_page => 20, :page => params[:page])
end

def right?
  self.right
end

end
