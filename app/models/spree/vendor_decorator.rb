# module Spree
#   module VendorDecorator
#     def self.prepended(base)
#       base.has_many :slides
#     end
#   end
# end
# ::Spree::Vendor.prepend(Spree::VendorDecorator)

