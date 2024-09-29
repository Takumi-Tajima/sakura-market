class ItemsController < ApplicationController
  def index
    @items = Item.where(display: true).default_order
  end

  def show
    @item = Item.find(params[:id])
    redirect_to root_path, alert: 'このアイテムは非表示です' unless @item.display
  end
end
