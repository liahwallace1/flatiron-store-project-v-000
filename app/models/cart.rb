class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, :foreign_key => "cart_id"
  has_many :items, through: :line_items

  def add_item
  end

  def total
    self.line_items.map do |line_item|
      line_item.quantity * line_item.item.price
    end.reduce(0, :+)
  end

end
