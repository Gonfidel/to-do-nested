class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_list
  before_action :set_board
  before_action :authenticate_user!

  # GET /items
  # GET /items.json
  def index
    @items = @list.items.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.list_id = @list.id
    respond_to do |format|
      if @item.save
        format.html { redirect_to [@board,@list,@item], notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: [@board,@list,@item] }
      else
        format.html { render :new }
        format.json { render json: [@board,@list,@item].errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [@board,@list,@item], notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: [@board,@list,@item] }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to board_list_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :list_id)
    end
end
