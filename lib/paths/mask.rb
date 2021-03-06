module Paths
  module Mask
    STORAGE_FOLDER = "#{File.dirname(__FILE__)}/../../storage".freeze
    SCRIPT_FOLDER = 'mask'.freeze
    SOURCE_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/source".freeze
    OUTPUT_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/output".freeze
    IMAGE_PATH = '%{folder_path}/%{image_name}'.freeze

    PATHS = {
        image: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'image.jpg' },
        mask: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'mask.jpg' },
        masked_pixel: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'masked_pixel.png'},
        masked_image: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'masked_image.png' }
    }.freeze
  end
end