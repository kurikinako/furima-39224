class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if @item.order.present? && @item.user != current_user
      redirect_to root_path
    elsif !user_signed_in? || @item.user == current_user
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :post_code, :sender_id, :city, :add_number, :building_name, :tel_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end

