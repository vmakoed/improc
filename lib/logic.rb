require 'rmagick'
require_relative 'common'

module Logic
  include Common

  def logic_not(image)
    pixels = image.export_pixels.map { |pixel| TOP_BRIGHTNESS - pixel }
    Magick::Image.constitute image.columns, image.rows, MODE, pixels
  end

  def perform(image_a, image_b)
    pixels = paired_pixels(image_a, image_b).map { |pair| yield pair[0], pair[1] }
    Magick::Image.constitute image_a.columns, image_a.rows, MODE, pixels
  end

  def logic_and(image_a, image_b)
    perform image_a, image_b, &:&
  end

  def logic_or(image_a, image_b)
    perform image_a, image_b, &:|
  end
end
