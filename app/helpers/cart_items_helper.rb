module CartItemsHelper
  def total_price_with_tax(cart_items)
    total_price = 0
    cart_items.each do |cart_item|
      total_price += cart_item.price_with_quantity
    end
    t('items.price_with_tax', price: number_to_currency(total_price, unit: '¥', precision: 0))
  end
end
