class StatisticsController < ApplicationController
  def summary
    @sales = OrderNoteComponent.all.map(&:price).sum
    @customers = Customer.count
    @orders = OrderNote.count
    @sales_per_customer = @sales / @customers
    @orders_per_customer = @orders.to_f / @customers.to_f

    @products_count = Product.all.map do |p|
      [p.name, p.order_note_components.map(&:amount).sum]
    end
    @products_sales = Product.all.map do |p|
      [p.name, p.order_note_components.map(&:price).sum]
    end    

    @sales_by_group = ProductGroup.all.map do |pg|
      [pg.name, 
      pg.products.map{|p| p.order_note_components.map(&:price).sum}.sum]
    end

    @orders_by_hour = sum_group_by(OrderNote.all, ->(on){time_floor on.created_at, 15.minutes}, ->(on){1})
  end


  def sum_group_by collection, lambda_group, lambda_term
    result = Hash.new 0
    collection.each do |item|
      group = lambda_group.call(item)
      result[group] += lambda_term.call(item)
    end
    result
  end

  def time_floor dt, step_size
    Time.at((dt.to_f / step_size).round * step_size)
  end
end
