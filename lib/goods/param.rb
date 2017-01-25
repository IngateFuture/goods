# don't create ParamsList container for param element because
# elements added to container are stored in hash internally
# where keys are their ids but param element has no id attribute
# (it's declared in Element for all elements but it's nil for Param)
module Goods
  class Param < Element
    attr_field :name
    attr_field :unit
    attr_field :value

    private

    def apply_validation_rules
      validate :name, proc { |v| v.present? }
      validate :value, proc { |v| v.present? }
    end
  end
end
