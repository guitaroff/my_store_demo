class ItemsController < ApplicationController

  def index
    @items = Item.all
    # render text: @items.map { |i| "#{i.name}: #{i.price}" }.join("<br/>")
  end

  # /items/1 GET
  def show
    # указываем какой-нибудь метод, чтобы был запрос к БД
    unless @item = Item.where(id: params[:id]).first
      render text: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items POST
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new'
    end
    #render text: params.inspect
  end

  # /items/1/edit GET
  def edit
  end

  # /items/1 PUT
  def update
  end

  # /items/1 DELETE
  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :real, :weight)
  end
end
