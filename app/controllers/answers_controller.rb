class AnswersController < InheritedResources::Base

def index
  @answers = Answer.scoped(params[:id])
end

end
