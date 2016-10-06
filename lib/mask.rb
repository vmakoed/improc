require 'rmagick'
require_relative 'common'
require_relative 'logic'

module Mask
  include Common
  include Logic

  def mask(image, mask, mask_x, mask_y, mask_width, mask_height)
    applied_mask = fetch_mask(image, mask, mask_x, mask_y, mask_width, mask_height)
    logic_and image, applied_mask
  end

  def fetch_mask(image, mask, mask_x, mask_y, mask_width, mask_height)
    return mask if mask.is_a? Magick::Image
    mask_from_pixel(image, mask, mask_x, mask_y, mask_width, mask_height)
  end

  def mask_from_pixel(image, pixel, mask_x, mask_y, mask_width, mask_height)
    mask = Magick::Image.new(image.columns, image.rows) { self.background_color = 'white' }
    painter = Magick::Draw.new
    painter.stroke_opacity 0
    painter.stroke_width 0
    painter.fill "rgb(#{pixel.red}, #{pixel.green}, #{pixel.blue})"
    painter.rectangle(mask_x, mask_y, mask_x + mask_width, mask_y + mask_height)
    painter.draw mask
    mask
  end

  def masked?(column, row, mask_x, mask_y, mask_width, mask_height)
    return false unless column.between?(mask_x, mask_x + mask_width)
    return false unless row.between?(mask_y, mask_y + mask_height)
    true
  end
end
