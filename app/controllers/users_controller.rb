class UsersController < ApplicationController

	before_action :set_user, only:[:show]

  def signin
  	@user = User.new
  end

  def signup
  	@user = User.new
  end

  def create



  	@user = User.new(user_params)
  	respond_to do |format|
  		if @user.save
  			format.html{redirect_to @user, notice: 'User was Successfully SignUp'}
  			format.json{render :signin, status: :created, location: @user}
  		end
  	end
  end

  def authenticate
    #puts 'xxxxxxxxxxxxxxxxxxxx', params[:user][:username].inspect
    #@user = User.find_by_username()
    #@username = params[:user][:username]
     if @user= User.find_by_username(params[:user][:username])
    respond_to do |format|
      if @user && @user.password == params[:user][:password]
        format.html{redirect_to users_status_path, notice: 'Congratulation!! You are login successfully'}
        format.json{render :status, status: :signed, location: users_status_path}
      else
        format.html{redirect_to users_status_path, notice: 'oops!! your type incorrect password'}
        format.json{render :status, status: :fail, location: users_status_path}
      end
    end
  else
      redirect_to users_status_path, alert: 'User does not exist'
  end
end
  def status
  end
  private

 def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user= User.find_by_username(params[:username])
  end

end
