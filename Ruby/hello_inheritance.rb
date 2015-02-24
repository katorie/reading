class Item
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "品名；#{@name}, 税抜き価格；#{@price}, 内税価格；#{sales_price}"
  end

  def sales_price
    (@price * 1.05).to_i
  end
end

class NoTaxItem < Item
  def sales_price
    @price
  end
end

[NoTaxItem.new("500円商品券", 50), 
  Item.new("菓子", 100)].each do |e|
    puts e
end
