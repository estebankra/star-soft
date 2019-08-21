class HasProductsController < ApplicationController
  before_action :set_has_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_secretary!

  # GET /has_products
  # GET /has_products.json
  def index
    @has_products = HasProduct.all
  end

  # GET /has_products/1
  # GET /has_products/1.json
  def show
  end

  # GET /has_products/new
  def new
    @has_product = HasProduct.new
  end

  # GET /has_products/1/edit
  def edit
  end

  # POST /has_products
  # POST /has_products.json
  def create
    @has_product = HasProduct.new(has_product_params)
    @order = Order.find(params[:has_product][:order_id])

    respond_to do |format|
      if @has_product.save
        format.html { redirect_to @order, notice: 'El producto se asigno al pedido correctamente' }
        format.json { render :show, status: :created, location: @has_product }
      else
        format.html { render :new }
        format.json { render json: @has_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /has_products/1
  # PATCH/PUT /has_products/1.json
  def update
    respond_to do |format|
      if @has_product.update(has_product_params)
        format.html { redirect_to @has_product, notice: 'El producto en el pedido se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @has_product }
      else
        format.html { render :edit }
        format.json { render json: @has_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /has_products/1
  # DELETE /has_products/1.json
  def destroy
    @order = Order.find(@has_product.order_id)
    @has_product.destroy
    respond_to do |format|
      format.html { redirect_to @order, notice: 'El producto se retiro del pedido correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_has_product
      @has_product = HasProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def has_product_params
      params.require(:has_product).permit(:order_id, :product_id, :specs_f, :specs_b, :quantity, :color, :design)
    end
end
