require 'rmagick'
require_relative 'common'

module Arithmetic
  include Common

  def perform image_a, image_b
    pixels =  paired_pixels(image_a, image_b).map { |pair| threshold(yield pair[0], pair[1]) }
    Magick::Image.constitute image_a.columns, image_a.rows, MODE, pixels
  end

  def add(image_a, image_b)
    perform image_a, image_b, &:+
  end

  def subtract(image_a, image_b)
    perform image_a, image_b, &:-
  end
end