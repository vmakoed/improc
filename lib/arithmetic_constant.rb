require 'rmagick'
require_relative 'common'

module ArithmeticConstant
  include Common

  def perform(image, constant, &operator)
    pixels = generate_pixels(image, constant, &operator).flatten
    Magick::Image.constitute image.columns, image.rows, MODE, pixels
  end

  def generate_pixels(image, constant, &operator)
    image.export_pixels.each_slice(3).to_a.map do |pixel|
      pixel_perform(pixel, constant, &operator)
    end
  end

  def pixel_perform(pixel, constant)
    pixel_to_array(constant).zip(pixel).map { |pair| threshold(yield pair[0], pair[1]) }
  end

  def add(image, constant)
    perform image, constant, &:+
  end

  def multiply(image, constant)
    perform image, constant, &:*
  end
end
