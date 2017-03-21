class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, :foreign_key => "cart_id"
  has_many :items, through: :line_items
  STATUS = {
    :active => 0,
    :submitted => 1
  }

  def add_item(item_id)
    item = self.line_items.find_by(item_id: item_id)
    if item
      item.quantity += 1
    else
      item = self.line_items.build(item_id: item_id)
    end #returns item for saving to pass test
    item
  end

  def total
    self.line_items.map do |line_item|
      line_item.quantity * line_item.item.price
    end.reduce(0, :+)
  end

  def submitted?
    self.status == STATUS[:submitted]
  end

  def submit!
    self.status = 1
    self.save
  end

end
