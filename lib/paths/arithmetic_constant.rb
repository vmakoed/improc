module Paths
  module ArithmeticConstant
    STORAGE_FOLDER = "#{File.dirname(__FILE__)}/../../storage".freeze
    SCRIPT_FOLDER = 'arithmetic_constant'.freeze
    SOURCE_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/source".freeze
    OUTPUT_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/output".freeze
    IMAGE_PATH = '%{folder_path}/%{image_name}'.freeze

    PATHS = {
        image: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'image.jpg' },
        addition: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'addition.png' },
        multiplication: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'multiplication.png' }
    }.freeze
  end
end