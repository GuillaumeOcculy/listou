class ProductItemsController < ApplicationController
  before_action :set_product_list
  before_action :set_product_item, only: %i[ show edit update destroy ]

  # GET /product_items/1/edit
  def edit
  end

  # POST /product_items or /product_items.json
  def create
    @product_item = @product_list.items.new(product_item_params)
    @product_item.user = current_user

    respond_to do |format|
      if @product_item.save
        format.turbo_stream
        format.html { redirect_to product_list_url(@product_list), notice: "Product item was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_items/1 or /product_items/1.json
  def update
    respond_to do |format|
      if @product_item.update(product_item_params)
        format.turbo_stream
        format.html { redirect_to product_list_url(@product_list), notice: "Product item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_items/1 or /product_items/1.json
  def destroy
    @product_item.destroy

    respond_to do |format|
      format.html { redirect_to product_list_url(@product_list), notice: "Product item was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_list
      @product_list = ProductList.find(params[:product_list_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product_item
      @product_item = @product_list.items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_item_params
      params.require(:product_item).permit(:name, :category, :position)
    end
end
