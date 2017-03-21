class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    where("inventory>=?", 1)
  end

  def self.update_inventory(cart)
    cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end

end
