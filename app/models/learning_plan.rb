class LearningPlan < ActiveRecord::Base
  belongs_to :user
  belongs_to :all_test
  belongs_to :result
end
