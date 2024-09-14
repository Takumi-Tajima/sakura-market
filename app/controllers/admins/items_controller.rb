class Admins::ItemsController < Admins::ApplicationController
  before_action :set_item, only: %i[edit update destroy]

  def index
    @items = Item.default_order
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admins_items_path, notice: '商品の登録が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to admins_items_path, notice: '商品の編集が完了しました', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy!
    redirect_to admins_items_path, notice: '商品の削除が完了しました', status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :published)
  end
end
