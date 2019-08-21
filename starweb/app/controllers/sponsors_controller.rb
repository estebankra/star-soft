class SponsorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_secretary!
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  # GET /sponsors
  # GET /sponsors.json
  def index
    @q = Sponsor.ransack(params[:q])
    @sponsors = @q.result.page params[:page]
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(sponsor_params)

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to sponsors_url, notice: 'El auspiciante se creó correctamente.' }
        format.json { render :show, status: :created, location: sponsors_url }
      else
        format.html { render :new }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        format.html { redirect_to sponsors_url, notice: 'El auspiciante se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: sponsors_url }
      else
        format.html { render :edit }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_relation
    order = nil
    HasDetail.all.each do | hasDetail |
      if hasDetail.order_detail.id == @order_detail.id
        order = hasDetail.order
      end
    end
    @order_detail.destroy
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor.destroy
    respond_to do |format|
      format.html { redirect_to sponsors_url, notice: 'El auspiciante se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params.require(:sponsor).permit(:name, :image, :term)
    end
end
