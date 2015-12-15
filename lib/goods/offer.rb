module Goods
  class Offer < Element
    attr_accessor :category, :currency, :price
    attr_field :category_id, :currency_id, :available, :description,
               :model, :name, :picture, :vendor, :url
    attr_field :price, type: :float
    attr_field :type_prefix, :isbn, :adult

    def convert_currency(other_currency)
      self.price *= currency.in(other_currency)
      self.currency = other_currency
      @currency_id = other_currency.id
    end

    def change_category(other_category)
      self.category = other_category
      @category_id = other_category.id
    end

    def price=(price)
      @price = price
    end

    private

    def apply_validation_rules
      validate :id, proc { |val| !(val.nil? || val.empty?) }
      validate :category_id, proc { |category_id| category_id }
      validate :currency_id, proc { |currency_id| currency_id }
      validate :price, proc { |price| price && price >= 0 }
    end

  end
end
