class UsersController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :correct_user, :except => [:index, :logout, :new]  #user can see,edit,delete only self profile
  
  load_and_authorize_resource
  
  def logout
    sign_out
    redirect_to root_path
  end
  
  private
    
    def correct_user
      user = User.find(params[:id])
      unless user == current_user
        flash[:error] = 'You have not permissions'
        redirect_to root_path
      end
    end
  
end
