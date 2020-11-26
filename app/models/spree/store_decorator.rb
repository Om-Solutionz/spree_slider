module Spree
  module StoreDecorator
    def self.prepended(base)
      base.has_many :slides
    end
  end
end
::Spree::Store.prepend(Spree::StoreDecorator)