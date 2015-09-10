class Item < ActiveRecord::Base

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, presence: true

  after_initialize {} #Item.new; Item.first
  after_save       {} #Item.save; Item.create; Item.update_attributes()
  after_create     {}
  after_update     {}
  after_destroy    {} #item.destroy
end
