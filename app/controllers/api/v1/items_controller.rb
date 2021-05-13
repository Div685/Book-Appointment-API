class Api::V1::ItemsController < ApplicationController
  before_action :authorize_user, except: %i[index show]
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = Item.order_by_name
    render json: @items, status: 200
  end

  def create
    @item = Item.create!(item_params)
    render json: @item, status: :created
  end

  def show
    render json: @item, status: 200
  end

  def update
    if @item.update(item_params)
      render json: @item, status: 200
    else
      render json: { error: 'Item could not be updated.' }, status: 404
    end
  end

  def destroy
    @item.destroy
    render json: { message: 'Successfully deleted', deleted_item: @item }, status: 200
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :img)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
