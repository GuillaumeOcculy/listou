class ProductItemsController < ApplicationController
  before_action :set_product_item, only: %i[ show edit update destroy ]

  # GET /product_items or /product_items.json
  def index
    @product_items = ProductItem.all
  end

  # GET /product_items/1 or /product_items/1.json
  def show
  end

  # GET /product_items/new
  def new
    @product_item = ProductItem.new
  end

  # GET /product_items/1/edit
  def edit
  end

  # POST /product_items or /product_items.json
  def create
    @product_item = ProductItem.new(product_item_params)

    respond_to do |format|
      if @product_item.save
        format.html { redirect_to product_list_product_item_url(@product_item), notice: "Product item was successfully created." }
        format.json { render :show, status: :created, location: @product_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_items/1 or /product_items/1.json
  def update
    respond_to do |format|
      if @product_item.update(product_item_params)
        format.html { redirect_to product_list_product_item_url(@product_item), notice: "Product item was successfully updated." }
        format.json { render :show, status: :ok, location: @product_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_items/1 or /product_items/1.json
  def destroy
    @product_item.destroy

    respond_to do |format|
      format.html { redirect_to product_items_url, notice: "Product item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_item
      @product_item = ProductItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_item_params
      params.require(:product_item).permit(:product_list_id, :user_id, :name, :slug, :status, :position, :category)
    end
end
