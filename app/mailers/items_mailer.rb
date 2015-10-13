class ItemsMailer < ApplicationMailer
  default from: "info@mystore.com", template_path: 'mailers/items'

  def item_destroyed(item)
    @item = item
    mail to: 'info@mystore.com', subject: "Item #{@item.name} destroed"
  end
end
