module Common
  TOP_BRIGHTNESS = 65535
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
end