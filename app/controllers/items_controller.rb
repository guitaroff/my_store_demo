class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    #@items = Item.order(id: :asc)
    @items = Item
    @items = @items.where("price >= ? OR votes_count = ?", 200, 0).order(votes_count: :desc, price: :asc)
    @items = @items.where("created_at >= ?", 1.day.ago) if params[:today]
    @items = @items.where("votes_count >= ?", params[:votes_from]) if params[:votes_from]
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
      flash[:success] = "Success Update!"
      redirect_to item_path(@item)
    else
      flash.now[:error] = "You made mistakes in your form!"
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
