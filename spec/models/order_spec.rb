require 'rails_helper'

describe 'Order' do
  it 'calculates the total price of the order' do
    item1 = Item.new(name: 'item1', price: 10)
    item2 = Item.new(name: 'item2', price: 15)

    order = Order.new
    order.items << item1
    order.items << item2

    order.calculate_total
    order.total.should == 25
  end
end
