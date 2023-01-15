class Api::V1::UsersController < ApplicationController
  before_action :authorize_user, only: %i[show fetch_user_coupons]

  def fetch_user_coupons
    @coupon_code = Coupon.find_by(code: coupon_params[:code])
    @user_coupons = @current_user.user_coupons.find_by(coupon_id: @coupon_code.id)
    render json: @user_coupons, include: %i[coupon], status: 200
  end

  def show
    render json: @current_user, status: 200
  end

  def create
    @user = User.create!(username: user_params[:username], password: user_params[:password])

    @signUp_coupon_code = Coupon.find_by(code: 'ABCD123!@#')

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      @user_coupon = UserCoupon.create!(user_id: @user.id, coupon_id: @signUp_coupon_code.id)
      render json: { status: :created, user: user_data(@user), token: token }, status: 201
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :user_id)
  end

  def coupon_params
    params.require(:coupon).permit(:code, :name, :percentage, :start_at, :end_at)
  end

  def user_data(user)
    {
      id: user.id,
      username: user.username,
      password: user.password,
      admin: user.admin
    }
  end
end
