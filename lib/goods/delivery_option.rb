# don't create DeliveryOptionsList container for delivery_options element because
# elements added to container are stored in hash internally
# where keys are their ids but delivery_option element has no id attribute
# (it's declared in Element for all elements but it's nil for DeliveryOption)
module Goods
  class DeliveryOption < Element
    attr_field :cost
    attr_field :days
    attr_field :order_before

    private

    def apply_validation_rules
      validate :cost, proc { |v| v.present? }
      validate :days, proc { |v| v.present? }
    end
  end
end
