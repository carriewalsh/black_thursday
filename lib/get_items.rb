module GetItems
  def get_items
    items = []
    contents = CSV.open "./data/items.csv", headers: true, header_converters: :symbol
    contents.each do |row|
      id = row[:id]
      name = row[:name]
      description = row[:description]
      unit_price = row[:unit_price]
      merchant_id = row[:merchant_id]
      created_at = row[:created_at]
      updated_at = row[:updated_at]

      item = Item.new(id: id,name: name,description: description,unit_price: unit_price,merchant_id: merchant_id,created_at: created_at,updated_at: updated_at)
      items << item
    end
    items
  end
end
