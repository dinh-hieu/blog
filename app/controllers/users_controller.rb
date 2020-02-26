class UsersController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'you have successfully register.' }
      else
        format.html { render :new }
      end
    end
  end
    def user_params
      params.require(:user).permit(:fullname, :email, :password)
    end
end
