class Answer < ActiveRecord::Base
  belongs_to :questions
  
  attr_accessible :right, :title, :question_id
end
