class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @items = Item.order(id: :asc)
    # render text: @items.map { |i| "#{i.name}: #{i.price}" }.join("<br/>")
  end

  # /items/1 GET
  def show
    # указываем какой-нибудь метод, чтобы был запрос к БД
    unless @item
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
    @item.update_attributes(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to items_path
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to items_path
  end

  def expensive
    @items = Item.where("price > 1000")
    render "index"
  end

  private

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :real, :weight)
  end
end
