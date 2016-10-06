require 'rmagick'

module Common
  TOP_BRIGHTNESS = 65535
  TOP_SATURATION_LUMINANCE = 255
  MODE = 'RGB'.freeze

  def paired_pixels(image_a, image_b)
    image_a.export_pixels.zip image_b.export_pixels
  end

  def pixel_to_array(pixel)
    %i(red green blue).map { |channel| pixel.send channel }
  end

  def threshold(value)
    return 0 if value < 0
    value > TOP_BRIGHTNESS ? TOP_BRIGHTNESS : value
  end

  def threshold_hsla(properties)
    [properties[0], properties[1..2].map { |value| threshold_saturation_luminance value }, properties[3]].flatten
  end

  def threshold_saturation_luminance(value)
    return 0 if value < 0
    value > TOP_SATURATION_LUMINANCE ? TOP_SATURATION_LUMINANCE : value
  end

  def histogram(values)
    values.group_by { |value| value }.reduce({}) { |a, (key, value)| a.merge key => value.count }
  end

  def sorted_histogram(values)
    histogram(values).sort_by { |key, _| key }
  end

  def rgb_to_hsla(channels)
    Magick::Pixel.new(*channels).to_hsla
  end

  def hsla_to_rgb(properties)
    pixel = Magick::Pixel.from_hsla(*(threshold_hsla(properties)))
    [pixel.red, pixel.green, pixel.blue]
  end
end
