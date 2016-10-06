module Paths
  module Equalization
    STORAGE_FOLDER = "#{File.dirname(__FILE__)}/../../storage".freeze
    SCRIPT_FOLDER = 'equalization'.freeze
    SOURCE_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/source".freeze
    OUTPUT_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/output".freeze
    IMAGE_PATH = '%{folder_path}/%{image_name}'.freeze

    PATHS = {
        image: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'image.jpg' },
        equalized: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'equalized.png' }
    }.freeze
  end
end