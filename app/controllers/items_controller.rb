class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = Item.all
      render :new
    end
  end

  def show
  end

  def edit
    if user_signed_in? && @item.user == current_user
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :version, :category_id, :condition_id, :postage_id, :sender_id, :ship_date_id,
                                 :price).merge(user_id: current_user.id)
  end

  def require_login
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
