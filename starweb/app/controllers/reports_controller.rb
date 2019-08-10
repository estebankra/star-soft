class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @orders_completed = Order.where(:state => 'Completado').count
    @orders_wait = Order.where(:state => 'En espera').count
    @orders_in_process = Order.where(:state => 'En proceso').count
    @clients_count = Client.count
    @invoices_total = InvoicingLedgerItem.first
    clients_frequents = Order.group(:client_id).count
    @client_first = Client.find(clients_frequents.first[0])
    @secretary_users = User.where(:permission_level => '1').count
    @team_users = User.where(:permission_level => '2').count
    @supplies = Supply.all
  end
end
