class Question < ActiveRecord::Base
  belongs_to :all_test
  has_many :answers    
end
