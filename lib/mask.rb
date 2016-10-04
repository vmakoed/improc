require 'rmagick'
require_relative 'common'

module Mask
  include Common

  def mask(image, mask_pixel, mask_x, mask_y, mask_width, mask_height)
    result = Magick::Image.new image.columns, image.rows

    image.each_pixel do |pixel, column, row|
      masked = masked? column, row, mask_x, mask_y, mask_width, mask_height
      stored_pixel = masked ? mask_pixel : pixel
      result.store_pixels column, row, 1, 1, [stored_pixel]
    end

    result
  end

  def masked?(column, row, mask_x, mask_y, mask_width, mask_height)
    return false unless column.between?(mask_x, mask_x + mask_width)
    return false unless row.between?(mask_y, mask_y + mask_height)
    true
  end
end