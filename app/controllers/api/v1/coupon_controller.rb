class Api::V1::CouponController < ApplicationController
  before_action :authorize_user

  def create
    if @current_user.admin == true
      @coupon = Coupon.create!(coupon_params)
      render json: @coupon, status: :created
    else
      render json: { error: 'Please login as Admin.' }, status: 401
    end
  end

  def show
    render json: @coupon, status: 200
  end

  def update
    if @coupon.update(coupon_params)
      render json: @coupon, status: 200
    else
      render json: { error: 'Coupon could not be updated.' }, status: 404
    end
  end

  def destroy
    @coupon.destroy
    render json: { message: 'Successfully deleted', deleted_item: @coupon }, status: 200
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code, :name, :percentage, :start_at, :end_at)
  end

  def coupon_data(coupon)
    {
      id: coupon.id,
      code: coupon.code,
      name: coupon.name,
      percentage: coupon.percentage,
      start_at: coupon.start_at,
      end_at: coupon.end_at
    }
  end
end
