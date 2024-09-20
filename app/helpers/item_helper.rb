module ItemHelper
  def p_with_tax(item)
    t('items.price_with_tax', price: number_to_currency(item.price_with_tax, unit: '¥', precision: 0))
  end
end
