class StatisticsController < ApplicationController
  def summary
    @products_count = OrderNoteComponent.joins(:product).group(:product_id).select("sum(order_note_components.amount) as product_sum, products.name").map{|c| [c.name, c.product_sum]}
  end
end
