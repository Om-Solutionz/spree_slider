class Spree::Slide < ActiveRecord::Base
  has_and_belongs_to_many :slide_locations,
                          class_name: 'Spree::SlideLocation',
                          join_table: 'spree_slide_slide_locations'

  has_one_attached  :image
                    # url: '/spree/slides/:id/:style/:basename.:extension',
                    # path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
                    # convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  # validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  belongs_to :store
  scope :published, -> { where(published: true).order('position ASC') }
  scope :location, -> (location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }

  #belongs_to :product, touch: true

  def initialize(attrs = nil)
    attrs ||= { published: true }
    super
  end

  def slide_name
    name.present? ? name : ''
  end

  def slide_link
    link_url.present? ? link_url : ''
  end

  def slide_image
    !image.file? && product.present? && product.images.any? ? product.images.first.attachment : image
  end
end
