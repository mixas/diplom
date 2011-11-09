class Ability
  #include CanCan::Ability
  
 # def initialize
  #  can :manage, :all if user.role == 'admin'
  #end
 
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can [:read, :run, :results, :check_answer], AdaptiveTest
      can [:show, :edit, :delete, :update, :logout], User
    end
  end
  
  
end
