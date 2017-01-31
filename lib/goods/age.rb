module Goods
  class Age < Element
    attr_field :unit
    attr_field :value

    private

    def apply_validation_rules
      validate :unit, proc { |v| v.present? }
      validate :value, proc { |v| v.present? }
    end
  end
end
