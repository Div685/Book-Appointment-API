class UsersController < ApplicationController

  def show
    # change this to current user instead of fining by id
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def create
    @user = User.create!(username: user_params[:username], password: user_params[:password])
    
    if @user.valid?
      render json: { status: :created, user: user_data(@user) }, status: 201
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :user_id )
  end

  def user_data(user)
    user_obj = {
      id: user.id,
      username: user.username,
      password: user.password,
      admin: user.admin
    }
    user_obj
  end
end
