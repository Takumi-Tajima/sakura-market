class ItemsController < ApplicationController
  def index
    @items = Item.visible.default_order
  end

  def show
    @item = Item.visible.find(params[:id])
  end
end
