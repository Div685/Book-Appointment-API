class Api::V1::UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def show
    render json: @current_user, status: 200
  end

  def create
    @user = User.create!(username: user_params[:username], password: user_params[:password])

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { status: :created, user: user_data(@user), token: token }, status: 201
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :user_id)
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
