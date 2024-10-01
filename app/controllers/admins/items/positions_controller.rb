class Admins::Items::PositionsController < ApplicationController
  def move_higher
    item = Item.find(params[:id])
    item.move_higher
    redirect_to admins_items_path
  end

  def move_lower
    item = Item.find(params[:id])
    item.move_lower
    redirect_to admins_items_path
  end
end
