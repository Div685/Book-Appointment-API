class Api::V1::UserCouponsController < ApplicationController
  before_action :authorize_user

  def index
    @user_coupons = @current_user.user_coupons
    render json: @user_coupons, status: 200
  end
end
