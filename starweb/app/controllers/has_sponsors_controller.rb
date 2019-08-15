class HasSponsorsController < ApplicationController
  before_action :set_has_sponsor, only: [:show, :edit, :update, :destroy]

  # DELETE /has_sponsors/1
  # DELETE /has_sponsors/1.json
  def destroy
    @order = Order.find(@has_sponsor.order_id)
    @has_sponsor.destroy
    respond_to do |format|
      format.html { redirect_to @order, notice: 'El auspiciante se retiro del pedido correctamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_has_sponsor
    @has_sponsor = HasSponsor.find(params[:id])
  end
end
