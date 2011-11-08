class AdaptiveTest < ActiveRecord::Base
  has_many :questions
  belongs_to :learning_plans
end
