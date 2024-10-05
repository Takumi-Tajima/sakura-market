class ItemsController < ApplicationController
  def index
    @items = Item.visible.default_order
  end

  def show
    @item = Item.visible.find(params[:id])
    @cart_item = @item.cart_items.build
  end
end
