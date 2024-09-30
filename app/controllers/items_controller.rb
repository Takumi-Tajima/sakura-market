class ItemsController < ApplicationController
  def index
    @items = Item.where(display: true).default_order
  end

  def show
    @item = Item.find(params[:id])
    redirect_to root_path, alert: '商品が見つかりません' unless @item.display
  end
end
