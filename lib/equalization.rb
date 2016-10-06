require 'rmagick'
require_relative 'common'

module Equalization
  include Common

  def equalize(image)
    pixels = hsla_equalized(image).map { |hsla_properties| hsla_to_rgb hsla_properties }.flatten
    Magick::Image.constitute image.columns, image.rows, MODE, pixels
  end

  def hsla_equalized(image)
    pixels_hsla = image.export_pixels.each_slice(3).to_a.map { |channels| rgb_to_hsla(channels) }
    luminance_equalized = equalize_cdf pixels_hsla.map { |properties| properties[2] }
    pixels_hsla.each_with_index.map { |properties, index| properties[2] = luminance_equalized[index]; properties }
  end

  def cdf(values)
    sorted_histogram(values).reduce({}) do |cdf, (value, count)|
      cdf.merge! value => cdf.keys.empty? ? count : count + cdf[cdf.keys.last]
      cdf
    end
  end

  def equalize_cdf(values)
    cdf_results = cdf(values)
    cdf_min = cdf_results.values.min
    pixels_capacity = values.count

    values.map { |value| equalize_value cdf_results[value], cdf_min, pixels_capacity }
  end

  def equalize_value(cdf, cdf_min, pixels_capacity)
    ((cdf - cdf_min).to_f / (pixels_capacity - cdf_min) * (TOP_SATURATION_LUMINANCE - 1)).round
  end
end