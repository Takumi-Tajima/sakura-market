class ItemsController < ApplicationController
  def index
    @items = Item.default_order
  end
end
