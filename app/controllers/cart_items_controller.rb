class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart_items = current_user.cart_items.eager_load(:item).ordered_by_creation
  end

  def create
    @cart_item = CartItem.add_or_update(current_user, cart_item_params[:item_id], cart_item_params[:quantity])
    if @cart_item.persisted?
      redirect_to items_path, notice: 'カートに追加しました'
    else
      redirect_to item_path(item_params[:item_id]), alert: 'カートに追加できませんでした'
    end
  end

  def destroy
    cart_item = current_user.cart_items.find(params[:id])
    cart_item.destroy!
    redirect_to cart_items_path, notice: 'カートから商品が削除されました。'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
