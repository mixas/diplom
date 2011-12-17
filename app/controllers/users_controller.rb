class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:test]
  before_filter :correct_user, :except => [:index, :logout, :new, :test]  #user can see,edit,delete only self profile

  load_and_authorize_resource

  def logout
    sign_out
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    if @user.role == 'admin'

    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def test

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
