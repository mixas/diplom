class LearningPlan < ActiveRecord::Base
  has_many :users
  has_many :adaptive_tests
end
