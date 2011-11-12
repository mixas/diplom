class AllTest < ActiveRecord::Base
  has_many :questions
  has_many :users, :through => :learning_plan
  has_many :learning_plans
end
