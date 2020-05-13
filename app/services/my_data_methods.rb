class MyDataMethods
  # { 'Bernice' => 191, 'Carlee' => 160, 'Edison' => 60, ... }
  def self.orders_by_client(properties)
    Order.joins(:client).group('clients.first_name').order('clients.first_name').count
  end

  def self.supplies_by_stock(properties)
    Supply.select(:name).group('name').order('name').count + stock
  end
end