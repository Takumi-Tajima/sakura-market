class ItemsController < Admins::ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.default_order
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy!
    redirect_to items_url, notice: 'Item was successfully destroyed.', status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :hidden)
  end
end
