class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart_items = current_user.cart_items.eager_load(:item).default_order
  end

  def create
    @cart_item = current_user.cart_items.build(item_params)

    if @cart_item.save
      redirect_to items_path, notice: 'カートに追加'
    else
      render item_path(@cart_item.item_id), status: :unprocessable_entity
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path, notice: 'カートから商品が削除されました。'
  end

  private

  def item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
