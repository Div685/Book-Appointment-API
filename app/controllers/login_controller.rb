class LoginController < ApplicationController
  def create
    @user = User.find_by(username: login_params[:username])

    if @user&.authenticate(login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { logged_in: true, user: user_data(@user), token: token }
    else
      render json: { errors: 'Invalid Password' }, status: 401
    end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end

  def user_data(user)
    user_obj = {
      id: user.id,
      username: user.username,
    }
    user_obj
  end

end
