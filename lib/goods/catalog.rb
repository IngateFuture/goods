module Goods
  class Catalog
    attr_reader :url, :name, :company, :categories, :currencies, :offers

    def initialize io:, url:, encoding:
      if io
        from_io_or_string(io, url, encoding)
      else
        raise ArgumentError, "should provide either :string or :url param"
      end
    end

    def prune(level)
      @offers.prune_categories(level)
      @categories.prune(level)
    end

    def convert_currency(other_currency)
      @offers.convert_currency(other_currency)
    end

    def date
      @xml.generation_date
    end

    private

    def from_io_or_string(xml_io, url, encoding)
      @xml = XML.new(xml_io, url, encoding)

      @name = @xml.name
      @company = @xml.company
      @url = @xml.url

      @categories = CategoriesList.new(@xml.categories)
      @currencies = CurrenciesList.new(@xml.currencies)
      @offers = OffersList.new(@categories, @currencies, @xml.offers)
    end
  end
end

