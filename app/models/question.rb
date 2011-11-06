class Question < ActiveRecord::Base
  belongs_to :adaptive_test
  has_many :answers    
end
