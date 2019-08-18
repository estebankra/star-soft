class ReportsMethods
  # { 'Bernice' => 191, 'Carlee' => 160, 'Edison' => 60, ... }
  def self.orders_by_client(properties)
    Order.joins(:client).group('client.first_name').order('client.first_name').count
  end
end