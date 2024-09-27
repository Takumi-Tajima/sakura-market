class ItemsController < ApplicationController
  def index
    @items = Item.where(display: true).default_order
  end

  def show
    @item = Item.find(params[:id])
  end
end
